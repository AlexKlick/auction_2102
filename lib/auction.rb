 class Auction
  attr_reader :items
   def initialize
    @items = []
   end
   def add_item(item)
    @items << item
  end

  def item_names
    @items.map{|item| item.name}
  end

  def unpopular_items
    @items.find_all{|item| item.bids == {}}
  end
  def potential_revenue
    rev = 0
    @items[0].current_high_bid
    @items.each{|item| rev += item.current_high_bid.to_i}
    rev
  end
 end