require 'net/http'
require 'json'

class View

    def initialize(nameModel)
        @nameItem = nameModel
        @nameList = nameModel + 's'
        @server_host = 'localhost'
        @server_port = '3000'
    end

    def list()
        response = get_json_url_get("http://#{@server_host}:#{@server_port}/#{@nameItem}")
        if response["status"]!="SUCCESS"
            puts "\nError when request!"
        else 
            arr = response["data"]
            puts "\n#{@nameList} List"
            puts "Number of #{@nameList}: #{arr.size}"
            puts "------------------------------"
            arr.each { |obj| printObj(obj) }
        end
    end

    def find()
        puts "\nEnter id:"
        id = gets.delete!("\n")

        response = get_json_url_get("http://#{@server_host}:#{@server_port}/#{@nameItem}/#{id}")
        if response["status"]!="SUCCESS"
            puts "\nError when request!"
        else 
            obj = response["data"]
            if obj.nil?
                puts "\n#{@nameItem} NOT found!"
                return nil 
            else
                printObj(obj)
            end
        end
    end  

    def printObj(obj)               
        puts "--not implemented printObj--"
    end

    def insert()
        params = getData()
        return if params.nil?
        resp = get_json_url_post("http://#{@server_host}:#{@server_port}/#{@nameItem}", params)
        puts (resp["status"]!="SUCCESS" ? "\nError when request! --> #{resp}" : "\n#{@nameItem} saved!")
    end

    def getData()
        puts "--not implemented getData--"
    end

    def update()
        params = getData()
        return if params.nil?
        resp = get_json_url_put("http://#{@server_host}:#{@server_port}/#{@nameItem}/#{params[:id]}", params)
        puts (resp["status"]!="SUCCESS" ? "\nError when request! --> #{resp}" : "\n#{@nameItem} updated!")
    end

    def get_json_url_get(source)
        resp = Net::HTTP.get_response(URI.parse(source))
        return JSON.parse(resp.body)
    end

    def get_json_url_post(source, params)
        resp = Net::HTTP.post_form(URI.parse(source), JSON.parse(params))
        return JSON.parse(resp.body)
    end
    
    def get_json_url_put(source, params)
        uri = URI(source)
        req = Net::HTTP::Put.new(uri)
        req.set_form_data(params)
        resp = Net::HTTP.start(uri.hostname, uri.port) do |http|
            http.request(req)
        end
        return JSON.parse(resp.body)
    end

end