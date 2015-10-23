ActionMailer::Base.smtp_settings = {
  address: "smtp.mandrillapp.com",
  port: 587,
  enable_starttls_auto: true,
  user_name: 'sanczopan@gmail.com',
  password: 'bC8YbdcI9LFJ2XikjNkYGg',
  authentication: 'login',
  domain: 'tasiemka.info'
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"