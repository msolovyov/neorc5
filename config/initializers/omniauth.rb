Rails.application.config.middleware.use OmniAuth::Builder do
  require 'net/http'
  require 'net/https'
  require 'multi_xml'



end

