
require 'garage'

describe Garage do
    it 'receives broken bikes' do
        expect(subject).to respond_to(:receive_broken_bikes).with(1).argument
    end
end