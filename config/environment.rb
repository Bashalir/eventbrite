# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 465,
  :domain => "gmail.com", #you can also use google.com
  :authentication => :plain,
  :user_name => ENV["MAIL_LOGIN"],
  :password => ENV["MAIL_PWD"],
}
