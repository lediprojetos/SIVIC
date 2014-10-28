require "spec_helper"

describe SivicContcategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_contcategories").should route_to("sivic_contcategories#index")
    end

    it "routes to #new" do
      get("/sivic_contcategories/new").should route_to("sivic_contcategories#new")
    end

    it "routes to #show" do
      get("/sivic_contcategories/1").should route_to("sivic_contcategories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_contcategories/1/edit").should route_to("sivic_contcategories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_contcategories").should route_to("sivic_contcategories#create")
    end

    it "routes to #update" do
      put("/sivic_contcategories/1").should route_to("sivic_contcategories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_contcategories/1").should route_to("sivic_contcategories#destroy", :id => "1")
    end

  end
end
