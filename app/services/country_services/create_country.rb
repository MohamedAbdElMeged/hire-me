module CountryServices
    class CreateCountry
        def initialize(name)
            @name = name
        end
        def call
            create_country
            @country
        end
        private
        def create_country
            @country = Country.create!(
                name:@name
            )
        end
        
    end
    
end