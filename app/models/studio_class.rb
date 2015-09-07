class StudioClass < ActiveRecord::Base
  belongs_to :studio

  has_many :timeslots

  def to_param
    "#{id}-#{name.parameterize}"
  end

end
