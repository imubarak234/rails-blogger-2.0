require "rails_helper"

RSpec.describe "Posts Controller", :type => :request do  

  context "Tests for user#index" do 
    before(:example) {get "/users"} 

    it "testing correct template rendering" do 
      expect(response).to render_template('index')
    end

    it "testing correct repsonse status" do 
      expect(response).to have_http_status(:ok)
    end

    it "testing response body includes correct placeholder text" do
      expect(response.body).to include("")
    end
  end

  context "Tests for user#show" do
    before(:example) {get "/users/:id"} 

    it "testing correct template rendering" do 
      expect(response).to render_template('show')
    end

    it "testing correct repsonse status" do 
      expect(response).to have_http_status(:ok)
    end

    it "testing response body includes correct placeholder text" do
      expect(response.body).to include("")
    end
  end

end