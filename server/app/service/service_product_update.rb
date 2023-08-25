require_relative "../models/product.rb"

class ServiceProductUpdate < Service

    def execute(params)
        begin
            obj = Product.find(params[:id])
            return get_json_error_msg('Not found object by id.') if obj.nil?
            params[:created] = obj.created
            params[:updated] = Time.now
            upd = obj.update(params)
            return upd ? get_json_success(obj) : get_json_error(obj)
        rescue StandardError, AnotherError => e
            return get_json_error_msg(e.inspect)
        end
    end

end

