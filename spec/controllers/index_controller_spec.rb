require 'spec_helper'

describe "Index Controller" do
  
  it "GET '/' should redirect guests to welcome page" do
    get "/"
    follow_redirect!
    expect(last_request.url).to eq("http://example.org/welcome")
  end

  it "GET '/welcome'" do
    get "/welcome"
    expect(last_response).to be_ok
    assert_select "title", "Welcome to CodeVault"
  end

end