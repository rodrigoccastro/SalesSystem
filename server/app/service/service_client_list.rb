require_relative "../models/client.rb"

class ServiceClientList < Service

    def execute()
        return Client.order('updated DESC');
    end

end

