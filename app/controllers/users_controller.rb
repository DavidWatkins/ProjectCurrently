class UsersController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]
  skip_before_action :is_admin, only: [:new, :create]

  def index
    if @current_user[:role] == "admin"
      @users = User.all
    elsif @current_user
      redirect_to @current_user
    else
      redirect_to root_url
    end
  end

  def show
    @user = @current_user
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    params[:user][:email].downcase!
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session[:user_id] = nil
    @user.destroy
    redirect_to root_url
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :school)
    end
end
