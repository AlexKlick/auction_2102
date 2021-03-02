require "minitest/autorun"
require "minitest/pride"
require './lib/item'
class ItemTest < Minitest::Test

  def setup
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end
  
  def test_attributes
    assert_equal @item1.name, "Chalkware Piggy Bank"

  end
end