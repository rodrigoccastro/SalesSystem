require 'rails_helper' 

describe Seller do 

    it "validate params" do 
        params_hash = {:id => "1", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        obj = Seller.new(params_hash) 
        expect(obj).to be_valid 
    end

    it "invalid id" do 
        obj = Seller.new(id: nil) 
        obj.valid?   
        expect(obj.errors[:id]).to include("can't be blank") 
    end 

    it "invalid same id" do 
        params_hash = {:id => "2323", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        obj = Seller.create(params_hash) 
        params_hash2 = {:id => "2323", :name => "name2", :email => "email2", :phone => "1232", :address => "add2"} 
        expect{ Seller.create(params_hash2) }.to raise_error(ActiveRecord::RecordNotUnique)
    end 

    it "invalid name" do 
        obj = Seller.new(name: nil) 
        obj.valid?   
        expect(obj.errors[:name]).to include("can't be blank") 
    end 

end