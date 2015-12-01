# ## Schema Information
#
# Table name: `studios`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `integer`          | `not null, primary key`
# **`email`**                   | `string`           | `default(""), not null`
# **`encrypted_password`**      | `string`           | `default(""), not null`
# **`reset_password_token`**    | `string`           |
# **`reset_password_sent_at`**  | `datetime`         |
# **`remember_created_at`**     | `datetime`         |
# **`sign_in_count`**           | `integer`          | `default(0), not null`
# **`current_sign_in_at`**      | `datetime`         |
# **`last_sign_in_at`**         | `datetime`         |
# **`current_sign_in_ip`**      | `string`           |
# **`last_sign_in_ip`**         | `string`           |
# **`created_at`**              | `datetime`         | `not null`
# **`updated_at`**              | `datetime`         | `not null`
# **`name`**                    | `string`           |
# **`zipcode`**                 | `string`           |
# **`phone`**                   | `string`           |
# **`address1`**                | `string`           |
# **`address2`**                | `string`           |
# **`logo_file_name`**          | `string`           |
# **`logo_content_type`**       | `string`           |
# **`logo_file_size`**          | `integer`          |
# **`logo_updated_at`**         | `datetime`         |
# **`studio_name`**             | `string`           |
# **`latitude`**                | `float`            |
# **`longitude`**               | `float`            |
#

class Studio < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address1.present? and obj.address1_changed? }

  validates :name, :studio_name, presence: true

  has_attached_file :logo,
    :storage => :s3,
    s3_permissions: "public-read",
    path: "/logos/:styles/:id/:filename",
    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/logos/:styles/missing.png"

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  has_many :studio_classes

  has_many :timeslots, :through => :studio_classes
  has_many :bookings, :through => :timeslots

  has_many :instructors

  def to_param
    "#{id}-#{studio_name.parameterize}"
  end

  def address
      [address1, zipcode].compact.join(', ')
  end

end
