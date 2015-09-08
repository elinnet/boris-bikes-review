require_relative 'bike_container'

class Van

  include BikeContainer 

  def take_bike bike
    fail "The van is full" if @bikes.count >= @capacity
    @bikes << bike
  end
  alias :add_bike :take_bike

  def unload_bike bike
    fail "There are no bikes in the van" if @bikes.empty?
    @bikes.pop
  end
  alias :remove_bike :unload_bike

end
