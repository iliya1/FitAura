class StudioClass < ActiveRecord::Base
  belongs_to :studio
  has_many :timeslots

  attr_accessor :price
  
  validates :name, :description, :instructor_name, :price, presence: true

  before_save :convert_price_to_points
  

  def to_param
    "#{id}-#{name.parameterize}"
  end


  def convert_price_to_points
    self.points = price.to_f * 10
  end

end
