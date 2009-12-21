require File.dirname(__FILE__) + '/../spec_helper'

describe Legislator do
  it "should be valid" do
    Legislator.new.should be_valid
  end
end
