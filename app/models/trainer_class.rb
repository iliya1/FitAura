# ## Schema Information
#
# Table name: `trainer_classes`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`trainer_id`**   | `integer`          |
# **`name`**         | `string`           |
# **`description`**  | `text`             |
# **`semiprivate`**  | `boolean`          | `default(FALSE)`
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
# **`points`**       | `integer`          |
# **`location_id`**  | `integer`          |
#

class TrainerClass < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :location
  has_many :timeslots, :as => :scheduleable
  has_many :bookings, through: :timeslots
  attr_writer :price

  def price
    points ? points / 10 : nil
  end

  def price=(val)
    self.points = val.to_f * 10
  end
end
