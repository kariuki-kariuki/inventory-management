require 'rails_helper'
require 'spec_helper'

RSpec.describe Asset, :type => :model do
    subject { Asset.new(name: "laptop",amount: "100") } 

    before {subject.save }

    
    it "Should have a name" do 
        subject.name = nil 
        expect(subject).to_not be_valid
    end 

    it "Should have a amount" do 
        subject.amount = nil 
        expect(subject).to_not be_valid
    end 

   

end 





