require 'bundler/setup'
require 'mini_magick'

cursor_x = 0
cursor_y = 0
increment_x = 0
increment_y = 'a'
main_image = MiniMagick::Image.open(ARGV[0])
while(cursor_y < main_image.dimensions[1]) do
  while(cursor_x < main_image.dimensions[0]) do
    image = MiniMagick::Image.open(ARGV[0])
    #puts "cropping " + "128x128+#{cursor_x}+#{cursor_y}"
    image.crop "128x128+#{cursor_x}+#{cursor_y}"
    filename = "#{ARGV[1]}_#{increment_y}_#{increment_x.to_s.rjust(2,'0')}"
    image.write "#{filename}.jpg"
    print ":#{filename}:"

    cursor_x = cursor_x + 128
    increment_x = increment_x + 1
  end
  cursor_x = 0
  cursor_y = cursor_y + 128
  increment_x = 0
  increment_y = increment_y.next
  print "\n"
end
