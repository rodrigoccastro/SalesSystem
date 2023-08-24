require_relative 'service.rb'
require_relative "../models/seller.rb"

class ServiceSeller < Service

    def initialize()
        super(Seller)
    end

end