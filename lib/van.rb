
require_relative 'DockingStation'

class Van

	DEFAULT_CAPACITY = 5

	attr_reader :dockingstation, :bikes, :capacity


    def initialize(capacity = DEFAULT_CAPACITY)
        @capacity = capacity
        @bikes = []
    end

	def station(dockingstation)
		@dockingstation = dockingstation
	end

	def collect_broken_bikes
	 	@bikes = @dockingstation.sort_broken_bikes
	end

	def van_dock(bike)
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