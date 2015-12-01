# ## Schema Information
#
# Table name: `bookings`
#
# ### Columns
#
# Name                | Type               | Attributes
# ------------------- | ------------------ | ---------------------------
# **`id`**            | `integer`          | `not null, primary key`
# **`user_id`**       | `integer`          |
# **`timeslot_id`**   | `integer`          |
# **`created_at`**    | `datetime`         | `not null`
# **`updated_at`**    | `datetime`         | `not null`
# **`booking_date`**  | `date`             |
#

class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :timeslot

  validates :timeslot_id, :booking_date, presence: true
  validates :timeslot_id, uniqueness: { :scope => [:user_id, :booking_date] }

end
