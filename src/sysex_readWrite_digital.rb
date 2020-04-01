# #!/usr/bin/env ruby
$:.unshift File.expand_path '../../lib', File.dirname(__FILE__)
require 'rubygems'
require 'arduino_firmata'

arduino = ArduinoFirmata.connect "/dev/ttyUSB0" 
puts "firmata version #{arduino.version}"

## regist event
arduino.on :sysex do |command, data|
    if command == 0x02
        puts "command : #{command}"
        puts "data    : #{data.inspect}"
    end 
end



loop do
    ## send sysex command at the digital tratament case 0x02.
    arduino.sysex 0x02, [22, 23]  #read at pin 22 and write at pin 23
    sleep 1
end 