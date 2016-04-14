require 'DockingStation'

require 'bike'

describe DockingStation do
    let(:bike) { double(:bike)}
    let(:broken_bike) { double(:broken_bike).report_broken}
    it 'responds to release_bike' do
        expect(DockingStation.new).to respond_to 'release_bike'
    end
    
    
    it 'releases working bikes' do
        subject.dock(bike)
        b = subject.release_bike
        expect(b).not_to be_broken    
    end


    it 'expects a bike to be docked' do
	     expect(DockingStation.new.dock(bike)).to eq [bike]
    end


   it 'contains bike' do
	     subject.dock(bike)
	     expect(subject.bikes).to include bike
   end


   it 'returns error if dockingstation has already given out the bike' do
        station = DockingStation.new
        expect{station.release_bike}.to raise_error 'No bikes available'
   end
  

    describe '#dock' do
        it 'raises an error when exceding DEFAULT_CAPACITY' do
          subject.capacity.times { subject.dock bike }
          expect { subject.dock bike }.to raise_error 'Dock already full'
        end

        it 'test docks a broken_bike' do
          bike.report_broken
          subject.dock(bike)
          expect(subject.dock(bike)).to include bike
        end

    end
    
    it 'Set new Docking station with DEFAULT_CAPACITY' do 
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY

    end

    it 'Set new DockingStation with user input' do 
      ds = DockingStation.new(8)
      expect(ds.capacity).to eq 8
    end

    it 'Does not releases broken bikes' do 
      bike.report_broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error 'no working bikes available'
    end



end
