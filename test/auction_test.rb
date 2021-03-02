require "minitest/autorun"
require "minitest/pride"
require './lib/item'
class AuctionTest < Minitest::Test

  def setup
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end
  
  def test_attributes
    assert_equal auction.items, []
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    assert_equal auction.items, [@item1, @item2]
  end
end