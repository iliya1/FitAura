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
