require_relative "../models/seller.rb"

class ServiceSellerCreate < Service

    def execute(params)
        begin
            obj = Seller.new(params)
            return obj.save! ? get_json_success(obj) : get_json_error(obj)
        rescue StandardError, AnotherError => e
            return get_json_error_msg(e.inspect)
        end
    end

end

