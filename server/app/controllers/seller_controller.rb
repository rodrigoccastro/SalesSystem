class SellerController < ApplicationController
    
    def index
    	render json: {status: 'SUCCESS', message:'Loaded sellers', data:ServiceSellerList.new.execute()},status: :ok
    end

    def show
        render json: {status: 'SUCCESS', message:'Loaded seller', data:ServiceSellerFind.new.execute(params[:id])},status: :ok
    end

    def create
        params_hash = {:id => params["id"], :name => params["name"], :email => params["email"], :phone => params["phone"], :address => params["address"]} 
        resp = ServiceSellerCreate.new.execute(params_hash)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Saved seller', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'seller not saved', data:resp},status: :unprocessable_entity
        end
    end

    def update
        params_hash = {:id => params["id"], :name => params["name"], :email => params["email"], :phone => params["phone"], :address => params["address"]} 
        resp = ServiceSellerUpdate.new.execute(params_hash)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Updated seller', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'seller not updated', data:resp},status: :unprocessable_entity
        end
    end

    def destroy
      
    end

end