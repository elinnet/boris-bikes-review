require_relative 'bike'
require_relative 'bike_container'
require 'byebug'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :bikes

  def initialize
    @bikes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_bike
    fail 'No bikes available' if (empty? || no_working_bikes?)
    @bikes.delete_at(@bikes.index { |bike| bike.working? })
  end

  def dock(bike)
    fail 'Docking station is full' if full?
    @bikes << bike
  end

  def load_van(bike)
    fail 'No broken bikes' if no_broken_bikes?
    @bikes.delete_at(@bikes.index{ |bike| bike.broken? })
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

  def no_working_bikes?
    @bikes.none? { |bike| bike.working? }
  end

  def no_broken_bikes?
    @bikes.all? { |bike| bike.working? }
  end
end
