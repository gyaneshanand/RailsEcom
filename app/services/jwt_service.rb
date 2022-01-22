class JwtService 
	# Method to encode the Payload into JWT Token
	def encode(payload, exp = 24.hours.from_now)
	     payload[:exp] = exp.to_i
	     jwt = JWT.encode(payload, Rails.application.secrets.secret_key_base)
	     jwt
   	end

   	# Method to decode the jwt token
   	def decode(token)
	     body = JWT.decode(token, Rails.application.secrets.secret_key_base)
   	rescue
     	raise NotAuthenticatedError.new("Token invalid.")
   	end
end