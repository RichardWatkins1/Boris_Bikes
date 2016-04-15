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
end