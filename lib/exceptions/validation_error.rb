class NoSuchUserError < StandardError
	def initialize(message)
		super(message)
	end
end