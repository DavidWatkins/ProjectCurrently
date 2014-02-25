
class User

  include Mongoid::Document


  has_many :Comments
  has_many :Projects
  has_many :SupportRequests

  field :name, type: String
  field :email, type: String
  field :school, type: String


end

