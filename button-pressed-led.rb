require 'artoo'

connection :arduino, adaptor: :firmata, port: '/dev/ttyUSB0'

device :led1, driver: :led, pin: 13
device :led2, driver: :led, pin: 12
device :button1, driver: :button, pin: 2, interval: 0.01
device :button2, driver: :button, pin: 4, interval: 0.01

work do
  puts "Two-Button activated LEDs [Iuri Madeira - github.com/iurimadeira]"
  puts "Press the buttons to light the LEDs... =D"

  on button1, :push    => proc { led1.on }
  on button1, :release => proc { led1.off }

  on button2, :push    => proc { led2.on }
  on button2, :release => proc { led2.off }
end
