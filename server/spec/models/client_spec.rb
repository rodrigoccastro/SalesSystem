require 'rails_helper' 

describe Client do 

    it "validate params" do 
        params_hash = {:id => "1", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        obj = Client.new(params_hash) 
        expect(obj).to be_valid 
    end

    it "invalid id" do 
        obj = Client.new(id: nil) 
        obj.valid?   
        expect(obj.errors[:id]).to include("can't be blank") 
    end 

    it "invalid same id" do 
        params_hash = {:id => "2323", :name => "name", :email => "email", :phone => "123", :address => "add"} 
        obj = Client.create(params_hash) 
        params_hash2 = {:id => "2323", :name => "name2", :email => "email2", :phone => "1232", :address => "add2"} 
        expect{ Client.create(params_hash2) }.to raise_error(ActiveRecord::RecordNotUnique)
    end 

    it "invalid name" do 
        obj = Client.new(name: nil) 
        obj.valid?   
        expect(obj.errors[:name]).to include("can't be blank") 
    end 

end