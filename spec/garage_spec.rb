
require 'garage'

require 'bike'

describe Garage do
    let(:bike) { double(:bike, report_broken: false, broken?: false, report_fixed: true) }
    let(:broken_bike) { double(:broken_bike, report_broken: true, broken?: true, report_fixed: false) }
    it 'responds to release_bike' do
        expect(Garage.new).to respond_to 'release_bike_to_van'
    end

    it 'expects a bike to be docked' do
	     expect(Garage.new.dock_to_garage(bike)).to include bike
    end


   it 'contains bike' do
	     subject.dock_to_garage(broken_bike)
	     expect(subject.broken_bikes).to include broken_bike
   end


   it 'returns error if dockingstation has already given out the bike' do
        station = Garage.new
        expect{station.release_bike_to_van}.to raise_error 'No bikes available'
   end
  

    describe '#dock' do
        it 'raises an error when exceding DEFAULT_CAPACITY' do
          subject.capacity.times { subject.dock_to_garage broken_bike }
          expect { subject.dock_to_garage broken_bike }.to raise_error 'Dock already full'
        end

        it 'test docks a broken_bike' do
          subject.dock_to_garage(broken_bike)
          expect(subject.dock_to_garage(broken_bike)).to include broken_bike
        end

    end
    
    it 'Set new Docking station with DEFAULT_CAPACITY' do 
      expect(subject.capacity).to eq Garage::DEFAULT_CAPACITY

    end

    it 'Set new DockingStation with user input' do 
      ds = Garage.new(8)
      expect(ds.capacity).to eq 8
    end

    it 'Does not releases broken bikes' do 
      subject.dock_to_garage(broken_bike)
      array = [broken_bike]
      subject.fix_bike(array)
      expect{subject.release_bike_to_van}.to raise_error 'no working bikes available'
    end


end