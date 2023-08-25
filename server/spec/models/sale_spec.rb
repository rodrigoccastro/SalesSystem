require 'rails_helper' 

describe Sale do 

    it "validate params" do
        params_hash = {:id => "1", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        cli = Client.new(params_hash) 
        cli.save!

        params_hash = {:id => "1", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        sel = Seller.new(params_hash) 
        sel.save!

        params_hash = {:client_id => cli[:id], :seller_id => sel[:id]}
        sale = Sale.new(params_hash)
        expect(sale).to be_valid 
    end

    it "without params" do 
        params_hash = {:client_id => nil, :seller_id => nil}
        sale = Sale.new(params_hash)
        sale.valid?   
        expect(sale.errors[:client_id]).to include("can't be blank") 
        expect(sale.errors[:seller_id]).to include("can't be blank") 
    end 

end