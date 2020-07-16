require_relative "../lib/robot.rb"
require "test/unit"

class TestClass < Test::Unit::TestCase
 
	def setup
    @obj = Robot.new("PLACE 1,3,EAST")
  end

  def test_valid_place
  	obj = Robot.new("PLACE 0,0,NORTH")
    obj = obj.check_valid_place
  	assert_equal(obj, true)
  end

  def test_case_1
    @obj.process_command("MOVE")
    @obj.process_command("MOVE")
    @obj.process_command("LEFT")
    report = @obj.process_command("REPORT")
    assert_equal(report, "3, 3, NORTH")
  end

  def test_case_2
    @obj.process_command("LEFT")
    @obj.process_command("MOVE")
    @obj.process_command("MOVE")
    @obj.process_command("MOVE")
    report = @obj.process_command("REPORT")
    assert_equal(report, "1, 5, NORTH")
  end

  
end
