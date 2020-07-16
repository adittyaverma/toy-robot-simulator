class Robot

	def initialize(place)
		place = place.gsub!("PLACE ", "")
		place = place.split(",")
		@new_x = place[0].to_i
		@new_y = place[1].to_i
		@face = place[2]
	end

	def check_valid_place
		if @new_x.between?(0,5) && @new_y.between?(0,5) && ["NORTH", "EAST", "SOUTH", "WEST"].include?(@face)
			valid_place = true
		else
			valid_place = false
		end
		return valid_place
	end

	def face_to_int(move)
		case @face
		when "NORTH"
			face_int = 0
		when "EAST"
			face_int = 1
		when "SOUTH"
			face_int = 2
		when "WEST"
			face_int = 3
		end
		arr = ["NORTH", "EAST", "SOUTH", "WEST"]
		if move == "LEFT"
			face_int = (face_int - 1) % 4
			@face = arr[face_int]
		elsif move == "RIGHT"
			face_int = (face_int + 1) % 4
			@face = arr[face_int]
		end
		return face_int
	end

	def move_fun(command)
		case @face
		when "NORTH"
			x = @new_x
			y = @new_y + 1
		when "SOUTH"
			x = @new_x
			y = @new_y - 1
		when "EAST"
			x = @new_x + 1
			y = @new_y
		when "WEST"
			x = @new_x - 1
			y = @new_y
		end
		if x.between?(0,5) && y.between?(0,5)
			@new_x = x
			@new_y = y
		end
	end

	def process_command(command)
		case command
		when "MOVE"
			nexCommand = ""
		  move_fun(command)
		when "LEFT"
			nexCommand = ""
			face_to_int("LEFT")
		when "RIGHT"
			nexCommand = ""
		  face_to_int("RIGHT")
		when "REPORT"
			nexCommand = "#{@new_x}, #{@new_y}, #{@face}"
		when command.include?("PLACE")
			nexCommand = ""
			# Ignoring this case
		else
			nexCommand = ""
		  puts "Not found right command"
		end
		return nexCommand
	end

end
