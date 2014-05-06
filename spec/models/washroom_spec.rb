require 'spec_helper'

describe Washroom do  
  
  it "should not allow creation of a blank washroom" do
    washroom = Washroom.new
    expect(washroom).to_not be_valid
  end

  it "should not allow saving a washroom without an address" do
    washroom = Washroom.new
    washroom.save
    washroom.errors.messages.should have_key(:address)
  end
end

