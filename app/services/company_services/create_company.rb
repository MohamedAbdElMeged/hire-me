module CompanyServices
    class CreateCompany
        def initialize(name)
            @name = name
        end
        def call
            create_company
            @company_id
        end
        private
        def create_company
            if @name && !@name.empty?
                @company_id = Company.find_or_create_by(name:@name).id
            end
            
        end
        
        
    end
end