

class Garage
  def initialize
    @bikes = []
  end


  def receive_bike bike
    @bikes << bike
  end

  def repair_bikes
    @bikes.each{|bike| bike.fix }
  end

end
