namespace :daily_stock_report do
  desc 'Generate daily stock value. '
  task :generate_daily_stock_value_report => :environment do
    puts "hello"
    #puts Sellercatalog.all().group(:user_id)

  end
end
