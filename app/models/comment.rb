
class Comment

  include Mongoid::Document


  belongs_to :user
  belongs_to :project

  field :content, type: String
end

