require 'rails_helper' 

describe Productsale do 

    it "validate params" do
        params_hash = {:id => "1", :name => "name", :price => 123.45} 
        prd = Product.new(params_hash) 
        prd.save!

        params_hash = {:id => "1", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        cli = Client.new(params_hash) 
        cli.save!

        params_hash = {:id => "1", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        sel = Seller.new(params_hash) 
        sel.save!

        params_hash = {:client_id => cli[:id], :seller_id => sel[:id]}
        sale = Sale.new(params_hash)
        sale.save!

        params_hash = {:sale_id => sale[:id], :product_id => prd[:id], :product_name => prd.name, :price => prd.price, :quantity => 123}
        prd_sale = Productsale.new(params_hash)
        expect(prd_sale).to be_valid 
    end

    it "without params" do 
        params_hash = {:id => "1", :name => "name", :price => 123.45} 
        prd = Product.new(params_hash) 
        prd.save!

        params_hash = {:id => "1", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        cli = Client.new(params_hash) 
        cli.save!

        params_hash = {:id => "1", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        sel = Seller.new(params_hash) 
        sel.save!

        params_hash = {:client_id => cli[:id], :seller_id => sel[:id]}
        sale = Sale.new(params_hash)
        sale.save!

        params_hash = {:sale_id => nil, :product_id => nil, :product_name => nil, :price => nil, :quantity => nil}
        prd_sale = Productsale.new(params_hash)
        prd_sale.valid?   
        expect(prd_sale.errors[:sale_id]).to include("can't be blank") 
        expect(prd_sale.errors[:product_id]).to include("can't be blank") 
        expect(prd_sale.errors[:product_name]).to include("can't be blank") 
        expect(prd_sale.errors[:price]).to include("can't be blank") 
        expect(prd_sale.errors[:quantity]).to include("can't be blank") 
    end 

end