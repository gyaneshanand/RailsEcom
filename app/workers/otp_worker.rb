class OtpWorker
  include Sidekiq::Worker

  def perform(user_id)
    user = User.find(user_id)
    otp = user.otp_code
    puts otp
  end
end
