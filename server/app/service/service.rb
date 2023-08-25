require 'pg'

class Service
    
    def get_json_success(obj)
        return {:success => true, :data => obj}
    end

    def get_json_error(obj)
        return {:success => false, :errors => obj.errors}
    end

    def get_json_error_msg(msg)
        return {:success => false, :message => msg}
    end
    
end

