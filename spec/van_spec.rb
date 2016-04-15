require 'DockingStation'
require 'van'

describe Van do
	let(:bike) {double(:broken_bike, report_broken: true, broken?: true)}
	let(:station) {double(:DockingStation, bike_broken: [:bike], sort_broken_bikes: [bike])}
	it 'returns broken bikes' do
		subject.station(station)
		station.sort_broken_bikes
		expect(subject.collect_broken_bikes).to eq [bike]
		end

	describe '#van_dock' do
        it 'it raises an error if van if full' do
          subject.capacity.times { subject.van_dock bike }
          expect { subject.van_dock bike }.to raise_error 'Dock already full'
        end
    end
    
    it 'set van DEFAULT_CAPACITY' do 
      expect(subject.capacity).to eq Van::DEFAULT_CAPACITY

    end

    it 'Set new DockingStation with user input' do 
      ds = Van.new(8)
      expect(ds.capacity).to eq 8
    end

end