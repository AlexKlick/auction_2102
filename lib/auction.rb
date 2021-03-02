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
  def bidders
    @bidders = @items.flat_map{|item| item.bids.map{|bid|bid[0].name}}.uniq
  end
  def bidder_info
    require 'pry'; binding.pry
    hash = Hash.new
    people = ''
    people = @items.map{|item| item.bids.map{|bid|bid[0]}}.flatten
    #people.each{|person| hash[person] = hash[:budget] = person.budget}
    # bidder_items = @items.map{|item| item.bidders.group_by{|bidder| bidder.name}}
    # bidders = self.bidders.map{|bidder| @items.find_all{|item| item.bids}.map{|bid| bid.bids.map{|bid|bid}}}.flatten.find_all{|line| line.class != Integer}.map{|person| person}
    # bidders.map {|bidder| hash[bidder] = {:budget = bidder.budget, :items = bidder.}}
  end
 end