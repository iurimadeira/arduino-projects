require 'artoo'

connection :arduino, :adaptor => :firmata, :port => '/dev/ttyUSB0' #linux
device :board, :driver => :device_info
device :led, :driver => :led, :pin => 13

work do
  puts "13-Pin LED Basic Blinking [Iuri Madeira - github.com/iurimadeira]"
  puts "Firmware name #{board.firmware_name}"
  puts "Firmata version #{board.version}"

  loop do
    sleep 0.1
    p a
    #led.toggle
  end
end
