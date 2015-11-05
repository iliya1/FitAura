class Certificate < ActiveRecord::Base
  belongs_to :trainer

  validates :title, presence: true
end
