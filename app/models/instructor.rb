# ## Schema Information
#
# Table name: `instructors`
#
# ### Columns
#
# Name                      | Type               | Attributes
# ------------------------- | ------------------ | ---------------------------
# **`id`**                  | `integer`          | `not null, primary key`
# **`name`**                | `string`           |
# **`about`**               | `string`           |
# **`studio_id`**           | `integer`          |
# **`created_at`**          | `datetime`         | `not null`
# **`updated_at`**          | `datetime`         | `not null`
# **`photo_file_name`**     | `string`           |
# **`photo_content_type`**  | `string`           |
# **`photo_file_size`**     | `integer`          |
# **`photo_updated_at`**    | `datetime`         |
#

class Instructor < ActiveRecord::Base
  belongs_to :studio
  has_one :studio_class
  validates :name, :about, presence: true

  has_attached_file :photo,
    :storage => :s3,
    s3_permissions: "public-read",
    path: "/instructors/:styles/:id/:filename",
    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/instructors/:styles/missing.png"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
