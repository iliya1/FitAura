# ## Schema Information
#
# Table name: `trainer_formats`
#
# ### Columns
#
# Name                      | Type               | Attributes
# ------------------------- | ------------------ | ---------------------------
# **`id`**                  | `integer`          | `not null, primary key`
# **`training_format_id`**  | `integer`          |
# **`trainer_id`**          | `integer`          |
# **`created_at`**          | `datetime`         | `not null`
# **`updated_at`**          | `datetime`         | `not null`
#

class TrainerFormat < ActiveRecord::Base
  belongs_to :trainer
  belongs_to :training_format
end
