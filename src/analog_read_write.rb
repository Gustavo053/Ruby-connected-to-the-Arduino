require 'rubygems'
require 'arduino_firmata'

arduino = ArduinoFirmata.connect "/dev/ttyUSB0"
puts "firmata version #{arduino.version}"


#LIGAR O LED E MANIPULAR O SEU BRILHO COM O POTENCIOMÊTRO

loop do
  an = arduino.analog_read 0 #Retorna entre 0 e 1023 (10bist)
  puts an
  arduino.analog_write 10, an/4 #Ajusta para a escala de 0 a 255 (8bits) do pwm
  sleep 0.1
end