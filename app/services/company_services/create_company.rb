module CompanyServices
    class CreateCompany
        def initialize(name)
            @name = name
        end
        def call
            create_company
            @company
        end
        private
        def create_company
            @company= Company.find_or_create_by(name:@name)
        
        
        end
        
        
    end
end