require_relative 'service.rb'
require_relative "../models/sale.rb"
require_relative "../models/productsale.rb"
require_relative "../models/client.rb"
require_relative "../models/seller.rb"
require 'json'

class ServiceSaleFind < Service

    def execute(id)
        begin
            sale = Sale.find(id)
            return JSON.parse(sale.to_json(:include => [:client,:seller,:productsales]))
        rescue StandardError, AnotherError => e
            return nil
        end
    end

end