class Bike

    def broken?
    	@broken
    end

    def report_broken
    	@broken = true
    end

    def report_fixed
    	@broken = false
    end

end
