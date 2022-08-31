require 'rails_helper'
require 'spec_helper'

RSpec.describe Request, :type => :model do
    subject { Request.new(name: ,category: ,status: ,urgency: ,:asset_id,:user_id,quantity:) } 

    before {subject.save }

    
    it "Should have a name" do 
        subject.name = nil 
        expect(subject).to_not be_valid
    end 

    it "Should have a category" do 
        subject.category = nil 
        expect(subject).to_not be_valid
    end 

    it "Should have a status" do 
        subject.status = nil 
        expect(subject).to_not be_valid
    end 

    it "Should have a urgency" do 
        subject.urgency = nil 
        expect(subject).to_not be_valid
    end
    
    it "Should have a asset_id" do 
        subject.asset_id = nil 
        expect(subject).to_not be_valid
    end

    it "Should have a user_id" do 
        subject.user_id = nil 
        expect(subject).to_not be_valid
    end
    it "Should have a quantity" do 
        subject.quantity = nil 
        expect(subject).to_not be_valid
    end

end 


# Some attributes not configured on frontend 


