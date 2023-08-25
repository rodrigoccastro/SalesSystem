require_relative 'service.rb'
require_relative "../models/sale.rb"
require_relative "../models/productsale.rb"
require_relative "../models/client.rb"
require_relative "../models/seller.rb"
require 'json'

class ServiceSaleList < Service

    def execute()
        sales = Sale.order('updated DESC');
        return JSON.parse(sales.to_json(:include => [:client,:seller,:productsales]))
    end

end