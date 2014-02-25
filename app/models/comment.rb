
class Comment

  include Mongoid::Document


  belongs_to :User
  belongs_to :Project

  field :content, type: String


end

