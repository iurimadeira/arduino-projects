require 'artoo'

connection :arduino, :adaptor => :firmata, :port => '/dev/ttyUSB0' #linux

device :sensor, driver: :analog_sensor, pin: 0, interval: 0.25, upper: 1023, lower: 0

constant = 0.488758553

work do

  puts
  puts "Thermometer [Iuri Madeira - github.com/iurimadeira]"
  puts "Reading sensor in analog pin #{ sensor.pin }"
  puts "Reading intervals every => #{ sensor.interval }"

  temperature = 0

  loop do
    result = sensor.analog_read(0) * constant
    temperature = result unless result == 0
    print "Temperature: #{temperature.round(2)} *C \r"
    sleep 0.25
  end
end

