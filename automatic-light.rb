require 'artoo'

connection :arduino, :adaptor => :firmata, :port => '/dev/ttyUSB0' #linux

interval = 0.25

device :led, driver: :led, pin: 11
device :sensor, driver: :analog_sensor, pin: 0, interval: interval, upper: 1023, lower: 0

work do

  light = led_brightness = 0

  puts
  puts "Automatic Light [Iuri Madeira - github.com/iurimadeira]"
  puts "Reading sensor in analog pin #{ sensor.pin }"
  puts "Maybe you should try to use a buzzer instead of a LED"

  loop do
    light = sensor.analog_read(0)
    led_brightness = 255 - light
    print "Light Sensor: #{ light } - LED Brightness: #{led_brightness}\r"

    if light <= 250
      led.on
      led.brightness(led_brightness)
    else
      led.off
    end

    sleep interval
  end
end

