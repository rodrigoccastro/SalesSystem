require 'rails_helper' 

describe Product do 

    it "validate params" do 
        params_hash = {:id => "1", :name => "name", :price => 123.45} 
        obj = Product.new(params_hash) 
        expect(obj).to be_valid 
    end

    it "invalid id" do 
        obj = Product.new(id: nil) 
        obj.valid?   
        expect(obj.errors[:id]).to include("can't be blank") 
    end 

    it "invalid same id" do 
        params_hash = {:id => "1", :name => "name", :price => 123.45} 
        obj = Product.create(params_hash) 
        params_hash2 = {:id => "1", :name => "name", :price => 123.45} 
        expect{ Product.create(params_hash2) }.to raise_error(ActiveRecord::RecordNotUnique)
    end 

    it "invalid name" do 
        obj = Product.new(name: nil) 
        obj.valid?   
        expect(obj.errors[:name]).to include("can't be blank") 
    end 

    it "invalid price" do 
        obj = Product.new(price: nil) 
        obj.valid?   
        expect(obj.errors[:price]).to include("can't be blank") 
    end 

end