require 'artoo'

connection :arduino, :adaptor => :firmata, :port => '/dev/ttyUSB0' #linux
device :board, :driver => :device_info
device :led, :driver => :led, :pin => 11

work do
  puts "13-Pin LED PWM Dimming [Iuri Madeira - github.com/iurimadeira]"
  puts "Firmware name #{board.firmware_name}"
  puts "Firmata version #{board.version}"

  led.on
  pwm = 0
  up = true

  loop do
    if up
      pwm += 3
    else
      pwm -= 3
    end

    if pwm >= 255
      up = false
    elsif pwm <= 0
      led.off
      sleep 1
      led.on
      up = true
    end

    p pwm
    led.brightness(pwm)
    sleep 0.01
  end
end
