require_relative 'service.rb'
require_relative "../models/sale.rb"
require_relative "../models/productsale.rb"
require_relative "../models/client.rb"
require_relative "../models/seller.rb"
require 'json'

class ServiceSaleUpdate < Service

    def execute(params)
        begin
            sale = Sale.find(params[:id])
            return get_json_error_msg('Not found object by id.') if sale.nil?

            ret = false
            Sale.transaction do
                Productsale.where(:sale_id => params["id"]).delete_all
                new_sale = {:id => params["id"], :client_id => params["client_id"], :seller_id => params["seller_id"], :created => sale.created, :updated => Time.now}
                sale.productsales = getListProductSales(params[:id], params["productsales"])
                ret = sale.update(new_sale)
            end
            return ret==true ? get_json_success(sale) : get_json_error(sale)
        rescue StandardError, AnotherError => e
            raise ActiveRecord::Rollback, e.inspect
            return get_json_error_msg(e.inspect)
        end
    end

    def getListProductSales(id, list)
        arrProductSales = []
        list.each do |item|
            prd = Product.find(item["product_id"])
            arrProductSales << Productsale.new({:sale_id => id, :product_id => item["product_id"], :product_name => prd.name, :price => prd.price, :quantity => item["quantity"]})
        end
        return arrProductSales
    end

end