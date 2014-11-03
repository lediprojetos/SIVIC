require "spec_helper"

describe SivicCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_categories").should route_to("sivic_categories#index")
    end

    it "routes to #new" do
      get("/sivic_categories/new").should route_to("sivic_categories#new")
    end

    it "routes to #show" do
      get("/sivic_categories/1").should route_to("sivic_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_categories/1/edit").should route_to("sivic_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_categories").should route_to("sivic_categories#create")
    end

    it "routes to #update" do
      put("/sivic_categories/1").should route_to("sivic_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_categories/1").should route_to("sivic_categories#destroy", :id => "1")
    end

  end
end
