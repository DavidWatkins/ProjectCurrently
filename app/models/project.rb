
class Project

  include Mongoid::Document

  has_many :SupportRequests
  has_many :Comments
  belongs_to :User

  field :name, type: String
  field :description, type: String


end

