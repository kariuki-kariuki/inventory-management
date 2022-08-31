require 'rails_helper'
require 'spec_helper'

RSpec.describe User, :type => :model do
    subject { User.new(email: "test@gmail.com",password: "test123",name: "John Doe",role: "admin") } 

    before {subject.save }

    
    it "Should have a email" do 
        subject.email = nil 
        expect(subject).to_not be_valid
    end 

    it "Should have a password" do 
        subject.password = nil 
        expect(subject).to_not be_valid
    end 

    it "Should have a name" do 
        subject.name = nil 
        expect(subject).to_not be_valid
    end 

    it "Should have a role" do 
        subject.role = nil 
        expect(subject).to_not be_valid
    end 

end 


