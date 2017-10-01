# frozen_string_literal: true

require 'yaml'
require 'twitter'
require 'ruby_gntp'

# secret
SECRET_FILE_NAME = 'secret.yml'

# Growl
GROWL_APP_NAME = 'Twitter Growl notify'
GROWL_NOTIFICATION_NAME = 'notify'

# secret
secret = YAML.load_file(SECRET_FILE_NAME)

# Twitter
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = secret['twitter']['consumer_key']
  config.consumer_secret     = secret['twitter']['consumer_secret']
  config.access_token        = secret['twitter']['access_token']
  config.access_token_secret = secret['twitter']['access_token_secret']
end

# Growl
growl = GNTP.new(GROWL_APP_NAME)
growl.register(
  notifications: [{
    name: GROWL_NOTIFICATION_NAME,
    enabled: true
  }]
)

puts 'started streaming...'

begin
  client.user do |object|
    case object
    when Twitter::Tweet
      puts
      puts '- - -'
      puts
      puts object.created_at.getlocal('+09:00').strftime('%Y/%m/%d %T')
      puts object.uri
      puts object.user.profile_image_url
      puts object.user.name
      puts object.full_text

      growl.notify(
        name: GROWL_NOTIFICATION_NAME,
        title: object.user.name,
        text: object.full_text,
        icon: object.user.profile_image_url
      )
    end
  end
rescue Interrupt
  puts
  puts
  puts 'see you!'
end
