require 'rubygems'
require 'mqtt'

# Publish example
MQTT::Client.connect('mqtt://rubyemqtttest:b2fb429381e6af84@broker.shiftr.io') do |c|
  c.publish('test', 'message')
end

# # Subscribe example
MQTT::Client.connect('mqtt://rubyemqtttest:b2fb429381e6af84@broker.shiftr.io') do |c|
  # If you pass a block to the get method, then it will loop
  c.get('test') do |topic, message|
    puts "#{topic}: #{message}"
  end
end