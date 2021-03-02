class Item
  attr_reader :name, :bids, :current_high_bid
  def initialize(name)
    @name = name
    @bids = {}
    @current_high_bid = current_high_bid
  end

  def add_bid(name, bid)
    @bids[name] = bid
  end

  def current_high_bid
    if @bids != {}
      @bids.max_by{|bid| bid[1]}[1]
    end
  end
end