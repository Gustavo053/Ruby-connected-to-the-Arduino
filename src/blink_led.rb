require 'rubygems'
require 'arduino_firmata'

cont = 0

arduino = ArduinoFirmata.connect "/dev/ttyUSB0"
puts "firmata version #{arduino.version}"

arduino.pin_mode 13, ArduinoFirmata::OUTPUT

stat = true
loop do
  puts stat
  arduino.digital_write 13, stat
  stat = !stat
  sleep 1
  cont = cont + 1
  if(cont == 20)
    break
  end
end
