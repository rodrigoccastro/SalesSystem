class ProductController < ApplicationController

    def index
    	render json: {status: 'SUCCESS', message:'Loaded products', data:ServiceProduct.new.list()},status: :ok
    end

    def show
        render json: {status: 'SUCCESS', message:'Loaded product', data:ServiceProduct.new.find(params[:id])},status: :ok
    end

    def create
        params_hash = {:id => params["id"], :name => params["name"], :price => params["price"]} 
        resp = ServiceProduct.new.insert(params_hash)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Saved product', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'Product not saved', data:resp},status: :unprocessable_entity
        end
    end

    def update
        params_hash = {:id => params["id"], :name => params["name"], :price => params["price"]} 
        resp = ServiceProduct.new.update(params_hash)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Updated product', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'product not updated', data:resp},status: :unprocessable_entity
        end
    end

    def destroy
      
    end
    
end