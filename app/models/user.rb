
class User

  include Mongoid::Document


  has_many :Comments
  has_many :Projects
  has_many :SupportRequests

  field :name, type: String
  field :email, type: String
  field :school, type: String

  validates :email, :presence => { :message => "Cannot have account without email"}
  validate :is_in_right_school

  def is_in_right_school
  	if :school.nil?
  		errors.add(:school, "Must have school field")
  	elsif( not school.to_s.eql? "Columbia University" and not school.to_s.eql? "Yale University" and not school.to_s.eql? "Brown University" )
      errors.add(:school, "Must be in columbia, yale, or brown, you entered: " + school.to_s)
    end
  end

  validates :name, :presence => { :message => "Must have a name"}
end

