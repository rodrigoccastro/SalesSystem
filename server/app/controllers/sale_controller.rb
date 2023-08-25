class SaleController < ApplicationController
    
    def index
    	render json: {status: 'SUCCESS', message:'Loaded sales', data:ServiceSaleList.new.execute()},status: :ok
    end

    def show
        render json: {status: 'SUCCESS', message:'Loaded sale', data:ServiceSaleFind.new.execute(params[:id])},status: :ok
    end

    def create
        resp = ServiceSaleCreate.new.execute(params)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Saved sale', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'sale not saved', data:resp},status: :unprocessable_entity
        end
    end

    def update
        resp = ServiceSaleUpdate.new.execute(params)
        if resp[:success]
            render json: {status: 'SUCCESS', message:'Updated sale', data:resp[:data]},status: :ok
        else
            render json: {status: 'ERROR', message:'sale not updated', data:resp},status: :unprocessable_entity
        end
    end

    def destroy
      
    end

end 