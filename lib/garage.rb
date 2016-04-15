
require_relative 'van'
require_relative 'bike'

class Garage
    
    attr_reader :capacity, :bikes
    
    DEFAULT_CAPACITY = 20
    
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
        @bike_broken = []
    end
    
     def dock_to_garage(bike)
        fail "Dock already full" if full?
        @bike_broken << bike
    end

     def fix_bike(bikes)
    	@bikes = @bike_broken.each {|bike| bike.report_fixed}
    	@bike_broken = []
    end

    def release_bike_to_van
        fail 'No bikes available' if empty?
        fail 'no working bikes available' if @bikes.last.broken?
        @bikes.pop
    end
    
    private
    
    
    def full?
        @bikes.count >= capacity
    end
    
    def empty?
        @bikes.empty?
    end
    
end