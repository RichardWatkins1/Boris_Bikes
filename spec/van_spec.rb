
require 'van'
describe Van do
	it 'collects broken bikes' do
		expect(subject).to respond_to(:collect_broken_bikes).with(1).argument 
	end
end