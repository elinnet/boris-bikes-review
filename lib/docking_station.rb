require_relative 'bike'
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

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end

  def no_working_bikes?
    bikes.none? { |bike| bike.working? }
  end
end
