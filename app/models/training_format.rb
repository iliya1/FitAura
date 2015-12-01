# ## Schema Information
#
# Table name: `training_formats`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`name`**         | `string`           |
# **`description`**  | `string`           |
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
#

class TrainingFormat < ActiveRecord::Base
  has_many :trainer_formats
  has_many :trainers, :through => :trainer_formats

  validates :name, presence: true
end
