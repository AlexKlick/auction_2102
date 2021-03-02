 class Attendee
  attr_reader :name, :budget, :items
  def initialize(data_hash)
     @name = data_hash[:name]
     @budget = data_hash[:budget][1..2].to_i
  end

 end