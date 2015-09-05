class Studio < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  validates :name, :zipcode, presence: true

  has_attached_file :logo,
    :storage => :s3,
    s3_permissions: "public-read",
    path: "/logos/:styles/:id/:filename",
    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/logos/:styles/missing.png"

  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
