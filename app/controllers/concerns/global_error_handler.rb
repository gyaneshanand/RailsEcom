# require './lib/exceptions/no_such_user_error.rb'

module GlobalErrorHandler extend ActiveSupport::Concern
	included do
		rescue_from Exception , with: :custom_exception_handler
	end

	def custom_exception_handler(exception)
		if exception.class == NoSuchUserError
			render json: {message: exception.message} , status: 400
		elsif exception.class == ActiveRecord::RecordNotFound
			render json: {message: exception.message} , status: 404
		elsif exception.class == NotFoundError
			render json: {message: exception.message} , status: 404
		elsif exception.class == NotAuthenticatedError
			render json: {message: exception.message} , status: 401
		elsif exception.class == ValidationError
			render json: {message: exception.message} , status: 400
		else
			render json: {message: exception.message} , status: 500
		end
	end
end
