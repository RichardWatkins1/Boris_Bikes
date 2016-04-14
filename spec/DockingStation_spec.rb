require 'DockingStation'

require 'bike'

describe DockingStation do
    it 'responds to release_bike' do
        expect(DockingStation.new).to respond_to 'release_bike'
    end
    
    
    it 'expects working to return true' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.release_bike).to be_working
    
    end


    it 'expects a bike to be docked' do
       bikes = Bike.new
	     expect(DockingStation.new.dock(bikes)).to eq [bikes]
    end


   it 'contains bike' do
	     bike = Bike.new
	     subject.dock(bike)
	     expect(subject.bikes).to include bike
   end


   it 'returns error if dockingstation has already given out the bike' do
        station = DockingStation.new
        expect{station.release_bike}.to raise_error 'No bikes available'
   end
  

    describe '#dock' do
        it 'raises an error when exceding DEFAULT_CAPACITY' do
          subject.capacity.times { subject.dock Bike.new }
          expect { subject.dock Bike.new }.to raise_error 'Dock already full'
        end
    end
    
    it 'Set new Docking station with DEFAULT_CAPACITY' do 
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY

    end

    it 'Set new DockingStation with user input' do 
      ds = DockingStation.new(8)
      expect(ds.capacity).to eq 8
    end



end
