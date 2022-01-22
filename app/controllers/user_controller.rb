class UserController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def index
  	@user = User.all
  	render json: @user
  end

  def create
  	@user = User.new(user_params)

    raise ValidationError.new("User Name can not be blank") if @user.name.blank?
    raise ValidationError.new("User Email can not be blank") if @user.email.blank?
    #raise ValidationError.new("Error occured in creating user") unless @user.save!

    @user.save!

    OtpWorker.perform_async(@user.id)

    jwt = JwtService.new.encode({user_id: @user.id})
		render json: jwt

  end

  def show
    raise NotAuthenticatedError.new('You are not allowed to view user id ' + params[:id] ) unless @user.id.to_i == params[:id].to_i
    render json: @user
  end

  private
  	def user_params
  		params.permit(:name,:email,:mobile,:user_type,:password,:password_confirmation)
  	end
end
