require "spec_helper"

describe SivicModelsController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_models").should route_to("sivic_models#index")
    end

    it "routes to #new" do
      get("/sivic_models/new").should route_to("sivic_models#new")
    end

    it "routes to #show" do
      get("/sivic_models/1").should route_to("sivic_models#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_models/1/edit").should route_to("sivic_models#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_models").should route_to("sivic_models#create")
    end

    it "routes to #update" do
      put("/sivic_models/1").should route_to("sivic_models#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_models/1").should route_to("sivic_models#destroy", :id => "1")
    end

  end
end
