require_relative "../models/seller.rb"

class ServiceSellerFind < Service

    def execute(id)
        begin
            return Seller.find(id)
        rescue StandardError, AnotherError => e
            return nil
        end
    end

end

