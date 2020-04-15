require 'rubygems'
require 'arduino_firmata'

arduino = ArduinoFirmata.connect "/dev/ttyUSB0"
puts "firmata version #{arduino.version}"

#ACENDER E DESLIGAR O LED

arduino.pin_mode 2, ArduinoFirmata::OUTPUT

stat = true
loop do
  puts stat
  arduino.digital_write 2, stat
  stat = !stat
  sleep 1
end 

