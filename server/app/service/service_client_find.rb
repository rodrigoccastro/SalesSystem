require_relative "../models/client.rb"

class ServiceClientFind < Service

    def execute(id)
        begin
            return Client.find(id)
        rescue StandardError, AnotherError => e
            return nil
        end
    end

end

