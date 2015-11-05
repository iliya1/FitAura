class TrainingFormat < ActiveRecord::Base
  has_many :trainer_formats
  has_many :trainers, :through => :trainer_formats

  validates :name, presence: true
end
