
require_relative 'van'
require_relative 'bike'

class Garage
    
    attr_reader :capacity, :bikes, :broken_bikes
    
    DEFAULT_CAPACITY = 20
    
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
        @broken_bikes = []
    end
    
     def dock_to_garage(bike)
        fail "Dock already full" if full?
        @broken_bikes << bike
    end

     def fix_bike(bikes)
    	array = bikes.each {|bike| bike.report_fixed}
    	@broken_bikes = []
    	@bikes = array
    end

    def release_bike_to_van
        fail 'No bikes available' if empty?
        fail 'no working bikes available' if @bikes.last.broken?
        @bikes.pop
    end
    
    private
    
    
    def full?
        @broken_bikes.count >= capacity
    end
    
    def empty?
        @bikes.empty?
    end
    
end