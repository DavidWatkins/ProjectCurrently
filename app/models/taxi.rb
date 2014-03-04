class Taxi	

  include Mongoid::Document

  field :license, type: String
  field :name, type: String
  field :license_type, type: String
  field :current_status, type: String
  field :dmv_license_plate_number, type: String
  field :vehicle_vin_number, type: String
  field :vehicle_type, type: String
  field :model_year, type: String
  field :medallion_type, type: String
  field :agent_number, type: String
  field :agent_name, type: String
  field :agent_telephone_number, type: String
  field :agent_website_address, type: String
  field :agent_addres, type: String
  field :last_updated_date, type: String
  field :last_updated_time, type: String

end
