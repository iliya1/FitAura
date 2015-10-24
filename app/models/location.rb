class Location < ActiveRecord::Base
  belongs_to :trainer
  has_many :trainer_classes

  validates :title, :address1, :zipcode, presence: true
end
