class Instructor < ActiveRecord::Base
  belongs_to :studio
  has_one :studio_class
  validates :name, :about, presence: true

  has_attached_file :photo,
    :storage => :s3,
    s3_permissions: "public-read",
    path: "/instructors/:styles/:id/:filename",
    styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/instructors/:styles/missing.png"

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

end
