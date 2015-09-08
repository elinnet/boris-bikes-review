

class Van

  DEFAULT_CAPACITY = 25

  attr_reader :capacity

  def initialize
    @capacity = DEFAULT_CAPACITY
    @bikes = []
  end

  def take_bike bike
    fail "The van is full" if @bikes.count >= 25
    @bikes << bike
  end

  def unload_bike bike
    fail "There are no bikes in the van" if @bikes.empty?
    @bikes.pop
  end

end
