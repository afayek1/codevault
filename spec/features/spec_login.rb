require 'spec_helper'

describe "Create a User" do
	it "Sucessfully Creates a User" do
		@user = User.create(name: "John")
		User.find(1)
	end
end