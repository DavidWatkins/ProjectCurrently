
class Project
  
  include Mongoid::Document
  include Mongoid::Paperclip


  has_many :comments
  belongs_to :user

  field :name, type: String
  field :description, type: String
  
  has_mongoid_attached_file :photo,
    :path => ':attachment/:id/:style.:extension',
    :styles => {
      :original => ['1920x1680>', :jpg],
      :small    => ['100x100#',   :jpg],
      :medium   => ['250x250',    :jpg],
      :large    => ['500x500>',   :jpg]
    },
    :convert_options => { :all => '-background white -flatten +matte' }
    
end

