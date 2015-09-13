require 'pusher'

config_pusher = YAML.load_file('config/pusher.yml')[Rails.env]
#Pusher.url = "https://#{config_pusher['access_key']}:#{config_pusher['access_key_secret']}@api.pusherapp.com/apps/{config_pusher['app_id']}"
Pusher.url = "http://fe98e1b3f646c9462325:b813e08d125fd1f9a51f@api.pusherapp.com/apps/141446"
Pusher.logger = Rails.logger