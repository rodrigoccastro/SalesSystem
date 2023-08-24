require_relative 'service.rb'
require_relative "../models/client.rb"

class ServiceClient < Service

    def initialize()
        super(Client)
    end

end

