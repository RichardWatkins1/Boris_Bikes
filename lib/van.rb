
require_relative 'DockingStation'

class Van

	attr_reader :dockingstation
	#def initialize(docking_station = DockingStation.new)
	#@docking_station = docking_station
	#end

	def station(dockingstation)
		@dockingstation = dockingstation
	end

	def collect_broken_bikes
	 	@dockingstation.sort_broken_bikes
	end
end