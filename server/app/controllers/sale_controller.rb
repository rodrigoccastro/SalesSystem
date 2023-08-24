class SaleController < ApplicationController
    
    def index
    	render json: {status: 'SUCCESS', message:'Loaded sales', data:ServiceSale.new.list()},status: :ok
    end

    def show
        render json: {status: 'SUCCESS', message:'Loaded sale', data:ServiceSale.new.find(params[:id])},status: :ok
    end

    def create
        resp = ServiceSale.new.insert(params)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Saved sale', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'sale not saved', data:resp},status: :unprocessable_entity
        end
    end

    def update
        resp = ServiceSale.new.update(params)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Updated sale', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'sale not updated', data:resp},status: :unprocessable_entity
        end
    end

    def destroy
      
    end

end 