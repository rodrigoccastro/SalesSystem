require_relative 'service.rb'
require_relative "../models/sale.rb"
require_relative "../models/productsale.rb"
require_relative "../models/client.rb"
require_relative "../models/seller.rb"
require 'json'

class ServiceSale < Service

    def initialize()
        super(Sale)
    end

    def list()
        sales = Sale.order('updated DESC');
        return JSON.parse(sales.to_json(:include => [:client,:seller,:productsales]))
    end

    def find(id)
        begin
            sale = @model.find(id)
            return JSON.parse(sale.to_json(:include => [:client,:seller,:productsales]))
        rescue StandardError, AnotherError => e
            return nil
        end
    end
    
    def insert(params)
        begin
            ret = false
            params_n = {:client_id => params["client_id"], :seller_id => params["seller_id"]}
            sale = Sale.new(params_n)
            Sale.transaction do
                ret = sale.save!
                if ret
                    sale.productsales = getListProductSales(sale[:id], params["productsales"])
                    ret = sale.save!
                end
            end
            return ret==true ? get_json_success(sale) : get_json_error(sale)
        rescue StandardError, AnotherError => e
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

    def update(params)
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

end