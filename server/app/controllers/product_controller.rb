class ProductController < ApplicationController

    def index
    	render json: {status: 'SUCCESS', message:'Loaded products', data:ServiceProductList.new.execute()},status: :ok
    end

    def show
        render json: {status: 'SUCCESS', message:'Loaded product', data:ServiceProductFind.new.execute(params[:id])},status: :ok
    end

    def create
        params_hash = {:id => params["id"], :name => params["name"], :price => params["price"]} 
        resp = ServiceProductCreate.new.execute(params_hash)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Saved product', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'Product not saved', data:resp},status: :unprocessable_entity
        end
    end

    def update
        params_hash = {:id => params["id"], :name => params["name"], :price => params["price"]} 
        resp = ServiceProductUpdate.new.execute(params_hash)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Updated product', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'product not updated', data:resp},status: :unprocessable_entity
        end
    end

    def destroy
      
    end
    
end