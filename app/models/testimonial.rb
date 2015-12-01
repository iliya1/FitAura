# ## Schema Information
#
# Table name: `testimonials`
#
# ### Columns
#
# Name               | Type               | Attributes
# ------------------ | ------------------ | ---------------------------
# **`id`**           | `integer`          | `not null, primary key`
# **`trainer_id`**   | `integer`          |
# **`name`**         | `string`           |
# **`testimonial`**  | `text`             |
# **`created_at`**   | `datetime`         | `not null`
# **`updated_at`**   | `datetime`         | `not null`
#

class Testimonial < ActiveRecord::Base
  belongs_to :trainer
end
