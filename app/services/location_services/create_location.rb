module LocationServices
    class CreateLocation
        def initialize(name)
            @name = name
        end
        def call
            create_location
            @location
        end
        private
        def create_location
            @location = Location.create!(
                name: @name
            )
        end
        
    end
    
end