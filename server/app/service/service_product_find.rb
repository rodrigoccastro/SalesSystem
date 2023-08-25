require_relative "../models/product.rb"

class ServiceProductFind < Service

    def execute(id)
        begin
            return Product.find(id)
        rescue StandardError, AnotherError => e
            return nil
        end
    end

end

