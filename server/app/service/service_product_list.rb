require_relative "../models/product.rb"

class ServiceProductList < Service

    def execute()
        return Product.order('updated DESC');
    end

end

