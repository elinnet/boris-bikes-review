class Bike

  attr_accessor :working

  def initialize
    @working = true
  end

  def working?
    @working
  end

  def broken?
    @working = !@working
  end

  def report_broken
    broken?
  end

  def fix
    @working = true
  end

end
