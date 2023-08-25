require_relative "../models/seller.rb"

class ServiceSellerList < Service

    def execute()
        return Seller.order('updated DESC');
    end

end

