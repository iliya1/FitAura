# ## Schema Information
#
# Table name: `studio_classes`
#
# ### Columns
#
# Name                   | Type               | Attributes
# ---------------------- | ------------------ | ---------------------------
# **`id`**               | `integer`          | `not null, primary key`
# **`studio_id`**        | `integer`          |
# **`name`**             | `string`           |
# **`description`**      | `text`             |
# **`points`**           | `integer`          |
# **`created_at`**       | `datetime`         | `not null`
# **`updated_at`**       | `datetime`         | `not null`
# **`instructor_name`**  | `string`           |
# **`instructor_id`**    | `integer`          |
#

class StudioClass < ActiveRecord::Base
  belongs_to :studio
  has_many :timeslots, :as => :scheduleable

  attr_writer :price
  
  validates :name, :description, :instructor_id, :price, presence: true

  belongs_to :instructor
  

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def convert_price_to_points
    raise convert
    self.points = price.to_f * 10
  end

  def price
    points ? points / 10 : nil
  end

  def price=(val)
    self.points = val.to_f * 10
  end

end
