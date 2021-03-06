# #!/usr/bin/env ruby
$:.unshift File.expand_path '../../lib', File.dirname(__FILE__)
require 'rubygems'
require 'arduino_firmata'

esp32 = ArduinoFirmata.connect "/dev/ttyUSB0" 
puts "firmata version #{esp32.version}"

## regist event
esp32.on :sysex do |command, data|
    if command == 0x03
        puts "command : #{command}"
        puts "data    : #{data.inspect}"
        puts '------------------------------------'
    end
end

loop do
    ## send sysex command at the tratament case analog 0x03
    esp32.sysex 0x03, [32, 33]  #read at pin 32 and write at pin 33

    sleep 0.001
end 