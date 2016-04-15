require_relative 'bike'

require_relative 'van'

class DockingStation
    
    attr_reader :capacity, :bikes
    
    DEFAULT_CAPACITY = 20
    
    
    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
        @bike_broken = []
    end
    
    def release_bike
        fail 'No bikes available' if empty?
        fail 'no working bikes available' if @bikes.last.broken?
        @bikes.pop
    end

    def sort_broken_bikes
        @bike_broken =  @bikes.select {|bike| bike.broken?}  
    end
    
    def dock(bike)
        fail "Dock already full" if full?
        @bikes << bike
    end
    
    private
    
    
    def full?
        @bikes.count >= capacity
    end
    
    def empty?
        @bikes.empty?
    end
    
end
