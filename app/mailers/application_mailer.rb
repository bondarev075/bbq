class ApplicationMailer < ActionMailer::Base
  default from: "bondarev075@gmail.com" # ENV['EMAIL']

  layout 'mailer'
end
