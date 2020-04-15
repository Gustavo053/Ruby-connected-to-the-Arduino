require 'rubygems'
require 'arduino_firmata'

arduino = ArduinoFirmata.connect "/dev/ttyUSB0"
puts "firmata version #{arduino.version}"

#LIGAR E DESLIGAR O LED COM BOTÃO

arduino.pin_mode 7, ArduinoFirmata::INPUT  
arduino.pin_mode 2, ArduinoFirmata::OUTPUT


loop do
  if arduino.digital_read 7
    arduino.digital_write 2, true
  else
    arduino.digital_write 2, false
  end
  sleep 0.5
end