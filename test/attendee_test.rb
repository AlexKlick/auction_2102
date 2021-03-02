require "minitest/autorun"
require "minitest/pride"
require './lib/item'
require './lib/attendee'
class AttendeeTest < Minitest::Test

  def setup
    @attendee = Attendee.new(name: 'Megan', budget: '$50')
  end
  
  def test_attributes
    #require 'pry'; binding.pry
    assert_equal @attendee.name, "Megan"
    assert_equal @attendee.budget, 50

  end
end