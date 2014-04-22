require 'spec_helper'

describe User do
 it "is invaild with out fist name" do
   FactoryGirl.build(:user, first_name: nil).should_not be_valid
 end
 it "is invaild with out last name" do
   FactoryGirl.build(:user, last_name: nil).should_not be_valid
 end
end
