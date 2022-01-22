class SessionsController < ApplicationController

	skip_before_action :authorized, only: [:login]

	def login
		user = User.find_by(id: params[:user_id])

		if user && user.authenticate(params[:password])
	  		jwt = JwtService.new.encode({user_id: user.id})
	  		# Storing User_id and corressponding JWT in Redis Cache
	  		Rails.cache.write(user.id , jwt.to_s)
	  		# Generating OTP
	  		OtpWorker.perform_async(user.id)
	  		render json: jwt
		 else
		 	raise NotAuthenticatedError.new('Login Failed. Either username or password incorrect.' )
	 	end
	end

	def logout
		user_id = @user.id
		Rails.cache.delete(user_id)
		render plain: "Logged Out Successfully."
	end
end
