
class SupportRequest

  include Mongoid::Document


  belongs_to :User
  belongs_to :Project

  field :description, type: String

  field :category, type: String

  field :percent_filled, type: Integer


end

