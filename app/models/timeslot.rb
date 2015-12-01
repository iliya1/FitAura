# ## Schema Information
#
# Table name: `timeslots`
#
# ### Columns
#
# Name                     | Type               | Attributes
# ------------------------ | ------------------ | ---------------------------
# **`id`**                 | `integer`          | `not null, primary key`
# **`days`**               | `text`             | `default([]), is an Array`
# **`start_time`**         | `time`             |
# **`duration`**           | `integer`          |
# **`created_at`**         | `datetime`         | `not null`
# **`updated_at`**         | `datetime`         | `not null`
# **`start_date`**         | `date`             |
# **`end_date`**           | `date`             |
# **`capacity`**           | `integer`          | `default(1)`
# **`scheduleable_id`**    | `integer`          |
# **`scheduleable_type`**  | `string`           |
#

class Timeslot < ActiveRecord::Base
  belongs_to :scheduleable, polymorphic: true
  
  has_many :bookings

  validates :start_time, presence: true

  def enum_days
    days.reject(&:empty?).join(", ")
  end

  def available_for_day(date)
    self.capacity - self.bookings_for_day(date).count
  end

  def bookings_for_day(date)
    self.bookings.where(booking_date: date)
  end

end
