class Item
  attr_reader :name, :bids
  def initialize(name)
    @name = name
    @bids = {}
  end

  def add_bid(name, bid)
    @bids[name] = bid
  end

  def current_high_bid
    @bids.max_by{|bid| bid[1]}[1]
  
  end
end