Rails.application.routes.draw do


  # YOUR_APP/config/routes.rb
mount Messenger::Engine, at: "/messenger"
 # get  'messenger/validate'
  #post 'messenger/webhook' => "messenger#webhook" , :defaults => { :format => 'json' }
 # root 'messenger#validate'#, :defaults => { :format => 'json' }

end

# Messenger::Engine.routes.draw do
#   get  :subscribe, to: "messenger#subscribe"
#   get  :webhook,   to: "messenger#validate"
# end
#
# Rails.application.routes.draw do
#   post 'messenger/webhook', to: "messenger#webhook"
# end
