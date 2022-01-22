class ApplicationController < ActionController::API
	include GlobalErrorHandler

	before_action :authorized

	def auth_header
  	request.headers['Authorization']
	end

	def get_token
      token = auth_header.split(' ')[1]
	end

	def decoded_token
    if auth_header
      body = JwtService.new.decode(get_token)
    end
	end

	def authorized
		if decoded_token
			user_id = decoded_token[0]['user_id']

			db_token = Rails.cache.read(user_id)
			raise NotAuthenticatedError.new('Invalid token now. Login Again') if db_token!=get_token

			@user = User.find_by!(id: user_id)
    else
    	raise NotAuthenticatedError.new('Please authenticate yourself first.' )
    end
	end
end
