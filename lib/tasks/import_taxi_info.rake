require 'rake'
namespace :taxi do 
	desc "This task imports taxi medallion information into the database"
	task :taxi_info_import => :environment do 
		puts "Starting to read in CSV"

		require 'csv'

		path = "lib\\tasks\\taxi_medallions.csv"
		CSV.foreach(File.path(path)) do |col|
			t = Taxi.new
			t.license = col[0].to_s.strip
			t.name = col[1].to_s.strip
			t.license_type = col[2].to_s.strip
			t.current_status = col[3].to_s.strip
			t.dmv_license_plate_number = col[4].to_s.strip
			t.vehicle_vin_number = col[5].to_s.strip
			t.vehicle_type = col[6].to_s.strip
			t.model_year = col[7].to_s.strip
			t.medallion_type = col[8].to_s.strip
			t.agent_number = col[9].to_s.strip
			t.agent_name = col[10].to_s.strip
			t.agent_telephone_number = col[11].to_s.strip
			t.agent_website_address = col[12].to_s.strip
			t.agent_addres = col[13].to_s.strip
			t.last_updated_date = col[14].to_s.strip
			t.last_updated_time = col[15].to_s.strip

			t.save
		end

	end
end
