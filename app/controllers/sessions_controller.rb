class SessionsController < ApplicationController
	
	skip_before_filter :require_user, :only => [:new, :create]
	
	def new
	end
	
	def create
		user = nil
		begin
			user = User.find_by(email: params[:session][:email])
		rescue Exception
		end
			
		if user
			session[:user_id] = user.id
			redirect_to '/dashboard'
		else
			redirect_to root_url, :flash => { :error => "Username was not found" }
		end  
	end
	
	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end

end
