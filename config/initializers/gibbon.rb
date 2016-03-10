if Rails.env.test? 
  Gibbon::Export.api_key = "fake" 
  Gibbon::Export.throws_exceptions = false 
end


Gibbon::Request.api_key = Rails.application.secrets.gibbonapiid
Gibbon::Request.timeout = 15
Gibbon::Request.throws_exceptions = false
