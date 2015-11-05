class Location < ActiveRecord::Base
  belongs_to :trainer
  has_many :trainer_classes

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address1.present? and obj.address1_changed? }

  validates :title, :address1, :zipcode, presence: true

  def address
      [address1, zipcode].compact.join(', ')
  end

end
