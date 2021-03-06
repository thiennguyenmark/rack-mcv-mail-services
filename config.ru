$LOAD_PATH.unshift '.'

require 'lib/base'
require 'app/controllers/home_controller'
require 'app/models/contact'

# use Rack::CommonLogger
use Rack::Static, root: 'app/assets', urls: ['/images', '/js', '/css']
use Rack::ContentLength
use Rack::Reloader, 0
use Base::Router do
  match '/index' => 'home#index'
  match '/' => 'home#contact'
  match '/send_mail_to_system' => 'home#send_mail_to_system'
end

run Base::Application
