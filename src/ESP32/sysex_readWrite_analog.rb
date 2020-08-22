# #!/usr/bin/env ruby
$:.unshift File.expand_path '../../lib', File.dirname(__FILE__)
require 'rubygems'
require 'arduino_firmata'

arduino = ArduinoFirmata.connect "/dev/ttyUSB0" 
puts "firmata version #{arduino.version}"

## regist event
arduino.on :sysex do |command, data|
    if command == 0x03
        puts "command : #{command}"
        puts "data    : #{data.inspect}"
        sleep 2
    end
end

## send sysex command at the tratament case analog 0x03
arduino.sysex 0x03, [32, 33]  #read at pin 32 and write at pin 33

loop do
    sleep 1
end 