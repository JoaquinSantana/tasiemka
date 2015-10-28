if Rails.env.test? 
  Gibbon::Export.api_key = "fake" 
  Gibbon::Export.throws_exceptions = false 
end


Gibbon::Request.api_key = 'b1bd6d470d0b689455d3fea0cf22a52c-us9'
Gibbon::Request.timeout = 15
Gibbon::Request.throws_exceptions = false
