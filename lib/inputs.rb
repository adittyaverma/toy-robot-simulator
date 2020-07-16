require_relative "robot"

puts "Welcome to Toy Simulator Program !"
puts "=================================="
puts "Enter PLACE X,Y,F comma separator"
puts "=================================="
place = gets.chomp

obj = Robot.new(place)
place = obj.check_valid_place

while !place do
	puts "Enter valid PLACE X, Y, F comma separator"
	place = gets.chomp
	obj = Robot.new(place)
	place = obj.check_valid_place
end

puts "=================================="
puts "Enter next command"

command = gets.chomp
nextCommand = obj.process_command(command)

while nextCommand == "" do
	puts "=================================="
	puts "Enter next command"
	command = gets.chomp
	nextCommand = obj.process_command(command)
end

puts "#{nextCommand}"
