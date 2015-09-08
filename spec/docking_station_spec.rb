require 'docking_station'
require 'support/shared_examples_for_bike_container'

describe DockingStation do

  it_behaves_like BikeContainer

  it { is_expected.to respond_to :release_bike }

  it 'shall not release a broken bike' do
    bike = double :bike, working?: false
    subject.dock bike
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  describe "#release_bike" do
    it "raises an error when there are no bikes available" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe "#dock" do

    it { is_expected.to respond_to(:dock).with(1).argument }

    it "releases a working bike" do
      bike = double :bike, working?: true
      subject.dock bike
      expect(subject.release_bike).to be_working
    end

    it 'has a default capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

    it "raises an error when full" do
      subject.capacity.times { subject.dock double :bike }
      expect { subject.dock double :bike }.to raise_error 'Docking station is full'
    end

    it "station capactiy can adjusted for a larger number" do
      subject.capacity = 50
      expect(subject.capacity).to eq 50
    end
  end

  describe "#load_van" do
    it "reports error when no broken bikes" do
      bike = double :bike, working?: true
      subject.dock bike
      expect { subject.load_van bike }.to raise_error 'No broken bikes'
    end
  end
end
