require_relative "view.rb"
require 'json'
require 'httparty'

class ViewSale < View

    def initialize()
        super('sale')
    end

    def insert()
        params = getData()
        return if params.nil?
        resp = get_json_url_post("http://#{@server_host}:#{@server_port}/#{@nameItem}", params)
        puts (resp["status"]!="SUCCESS" ? "\nError when request! --> #{resp}" : "\n#{@nameItem} saved!")
    end

    def update()
        puts "\nEnter id:"
        id = gets.delete!("\n")
        params = getData()
        params[:id] = id
        resp = get_json_url_put("http://#{@server_host}:#{@server_port}/#{@nameItem}/#{params[:id]}", params)
        puts (resp["status"]!="SUCCESS" ? "\nError when request! --> #{resp}" : "\n#{@nameItem} updated!")
    end

    def get_json_url_post(source, params)
        response = HTTParty.post(source, :headers => {'cache-control': 'no-cache','content-type': 'application/json'}, :body => params.to_json)
        return JSON.parse(response.body)
    end
    
    def get_json_url_put(source, params)
        response = HTTParty.put(source, :headers => {'cache-control': 'no-cache','content-type': 'application/json'}, :body => params.to_json)
        return JSON.parse(response.body)
    end
    
    def getData()
        puts "\nEnter Client Id:"
        client_id = gets.delete!("\n")

        puts "\nEnter Seller Id:"
        seller_id = gets.delete!("\n")

        puts "\nEnter number of products in this sale:"
        qtd = gets.delete!("\n").to_i
        if qtd<=0
            puts "\nInvalid quantity!"
            return nil 
        end

        count = 0;
        productsales = [];
        while count < qtd 
            contador = count+1

            puts "\nEnter Product Id of number (#{contador}):"
            product_id = gets.delete!("\n")

            puts "\nEnter how many products of number (#{contador}):"
            quantity = gets.delete!("\n").to_i
            if quantity<=0
                puts "\nInvalid quantity!"
                return nil 
            end

            productsale = {:product_id => product_id, :quantity => quantity}
            productsales[count] = productsale;
            count = count+1
        end
        return {:client_id => client_id, :seller_id => seller_id, :productsales => productsales}
    end

    def printObj(obj)               
        puts "\nId Sale: #{obj["id"]} - created: #{obj["created"]} - updated: #{obj["updated"]}"

        objClient = obj["client"]
        puts "\tClient Info"
        puts "\t\tId: #{objClient["id"]} - Name: #{objClient["name"]} - Email: #{objClient["email"]}"
        puts "\t\tPhone: #{objClient["phone"]} - Address: #{objClient["address"]}"
        puts "\t\tCreated: #{objClient["created"]} - Updated: #{objClient["updated"]}"

        objSeller = obj["seller"]
        puts "\tSeller Info"
        puts "\t\tId: #{objSeller["id"]} - Name: #{objSeller["name"]} - Email: #{objSeller["email"]}"
        puts "\t\tPhone: #{objSeller["phone"]} - Address: #{objSeller["address"]}"
        puts "\t\tCreated: #{objSeller["created"]} - Updated: #{objSeller["updated"]}"

        total = 0
        puts "\tList of Products"
        obj["productsales"].each do |productsale|
            partial = (productsale["price"].to_f * productsale["quantity"].to_i)
            puts "\t\tId: #{productsale["product_id"]} - name: #{productsale["product_name"]} - price: $ #{productsale["price"]} - quantity: #{productsale["quantity"]} --> partial: #{partial}"
            total = total + partial
        end

        puts "\tTotal: $ #{total}"
    end



end
