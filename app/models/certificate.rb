# ## Schema Information
#
# Table name: `certificates`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`trainer_id`**   | `integer`          |
# **`title`**        | `string`           |
# **`description`**  | `string`           |
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
#

class Certificate < ActiveRecord::Base
  belongs_to :trainer

  validates :title, presence: true
end
