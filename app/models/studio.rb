class Studio < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :name, :studio_name, :zipcode, presence: true

  has_attached_file :logo,
    :storage => :s3,
    s3_permissions: "public-read",
    path: "/logos/:styles/:id/:filename",
    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/logos/:styles/missing.png"

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  has_many :studio_classes

  has_many :timeslots, :through => :studio_classes
  has_many :bookings, :through => :timeslots

  def to_param
    "#{id}-#{studio_name.parameterize}"
  end

end
