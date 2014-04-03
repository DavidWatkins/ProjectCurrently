
class Project
  
  include Mongoid::Document
  include Mongoid::Paperclip


  has_many :comments
  belongs_to :user

  field :name, type: String
  field :description, type: String
  
  has_mongoid_attached_file :photo, :styles => { :small => "150x150>" },  
  :url => "/assets/products/:id/:style/:basename.:extension",  
  :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension" 

end

