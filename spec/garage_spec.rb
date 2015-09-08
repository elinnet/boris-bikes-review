require 'garage'
require 'support/shared_examples_for_bike_container'

describe Garage do
    it_behaves_like BikeContainer

    it 'fixes broken bikes' do
      bike = double :bike, broken?: false, fix: nil
      subject.add_bike bike
      subject.fix_bikes
      expect(bike).not_to be_broken
    end
end
