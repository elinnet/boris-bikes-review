require 'garage'
require 'bike'

describe Garage do

    xit 'repairs broken bikes' do
      bike = double :bike, working?: false, fix: nil
      subject.receive_bike bike
      subject.repair_bikes
      expect(bike).to be_working
    end
end
