
class Project

  include Mongoid::Document




  field :name, type: String

  field :owner, type: User

  field :description, type: String


end

