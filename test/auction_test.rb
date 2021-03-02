require "minitest/autorun"
require "minitest/pride"
require './lib/item'
require './lib/attendee'
require './lib/auction'
class AuctionTest < Minitest::Test

  def setup
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @item3 = Item.new('Homemade Chocolate Chip Cookies')
    @item4 = Item.new('2 Days Dogsitting')
    @item5 = Item.new('Forever Stamps')
    @attendee1 = Attendee.new(name: 'Megan', budget: '$50')
    @attendee2 = Attendee.new(name: 'Bob', budget: '$75')
    @attendee3 = Attendee.new(name: 'Mike', budget: '$100')
  
  end
  
  def test_attributes
    #
    assert_equal @auction.items, []
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    assert_equal @auction.items, [@item1, @item2]
    assert_equal @auction.item_names, [@item1.name, @item2.name]
   
  end

  def test_bids
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    assert_equal @item1.bids, {}
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    assert_equal @item1.bids, {@attendee1 => 22,@attendee2 => 20}
  end
  def test_current_high_bid
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    assert_equal @item1.bids, {}
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    assert_equal @item1.current_high_bid, 22
  end
  def test_unpopular
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    assert_equal @auction.unpopular_items, [@item2, @item3, @item5]
    @item3.add_bid(@attendee2, 15)
    assert_equal @auction.unpopular_items, [@item2, @item5]

  end

  def test_potential_rev
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    @auction.add_item(@item3)
    @auction.add_item(@item4)
    @auction.add_item(@item5)
    @item1.add_bid(@attendee1, 22)
    @item1.add_bid(@attendee2, 20)
    @item4.add_bid(@attendee3, 50)
    @item3.add_bid(@attendee2, 15)
    assert_equal @auction.potential_revenue, 87
  end
end