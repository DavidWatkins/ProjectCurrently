
class Project
  
  include Mongoid::Document

  has_many :comments
  belongs_to :user

  field :name, type: String
  field :description, type: String
  field :picture, type: String
  
  mount_uploader :picture, PictureUploader


end

