class NotAuthenticatedError < StandardError
	def initialize(message)
		super(message)
	end
end