class ClientController < ApplicationController
    
    def index
    	render json: {status: 'SUCCESS', message:'Loaded clients', data:ServiceClientList.new.execute()},status: :ok
    end

    def show
        render json: {status: 'SUCCESS', message:'Loaded client', data:ServiceClientFind.new.execute(params[:id])},status: :ok
    end

    def create
        params_hash = {:id => params["id"], :name => params["name"], :email => params["email"], :phone => params["phone"], :address => params["address"]} 
        resp = ServiceClientCreate.new.execute(params_hash)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Saved client', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'Client not saved', data:resp},status: :unprocessable_entity
        end
    end

    def update
        params_hash = {:id => params["id"], :name => params["name"], :email => params["email"], :phone => params["phone"], :address => params["address"]} 
        resp = ServiceClientUpdate.new.execute(params_hash)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Updated client', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'Client not updated', data:resp},status: :unprocessable_entity
        end
    end

    def destroy
      
    end

end 