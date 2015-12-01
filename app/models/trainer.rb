# ## Schema Information
#
# Table name: `trainers`
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
# **`photo_file_name`**         | `string`           |
# **`photo_content_type`**      | `string`           |
# **`photo_file_size`**         | `integer`          |
# **`photo_updated_at`**        | `datetime`         |
# **`latitude`**                | `float`            |
# **`longitude`**               | `float`            |
# **`about`**                   | `text`             |
# **`phone`**                   | `string`           |
# **`confirmation_token`**      | `string`           |
# **`confirmed_at`**            | `datetime`         |
# **`confirmation_sent_at`**    | `datetime`         |
# **`sex`**                     | `string`           |
# **`specialty`**               | `string`           |
# **`years_of_experience`**     | `string`           |
#

class Trainer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_attached_file :photo,
    :storage => :s3,
    s3_permissions: "public-read",
    path: "/photos/:styles/:id/:filename",
    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/photos/:styles/missing.png"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  has_many :locations
  has_many :trainer_classes
  has_many :timeslots, :through => :trainer_classes
  has_many :bookings, :through => :timeslots

  has_many :trainer_formats
  has_many :training_formats, :through => :trainer_formats

  has_many :testimonials

  has_many :certificates
end
