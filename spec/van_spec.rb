require 'van'

describe Van do

  it 'has a default capacity' do
    expect(subject.capacity).to eq Van::DEFAULT_CAPACITY
  end

  describe "#take_bike" do

    it { is_expected.to respond_to(:take_bike).with(1).argument }

    it 'raises an error when full' do
      bike = double :bike
      subject.capacity.times { subject.take_bike bike }
      expect { subject.take_bike bike }.to raise_error 'The van is full'
    end
  end

  describe "#unload_bike" do

    it { is_expected.to respond_to(:unload_bike).with(1).argument }

    it 'raises an error when there are no bikes' do
      bike = double :bike
      subject.take_bike bike
      subject.unload_bike bike
      expect { subject.unload_bike bike }.to raise_error 'There are no bikes in the van'
    end
  end


end
