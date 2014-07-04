require "spec_helper"

describe SivicCategoriaController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_categoria").should route_to("sivic_categoria#index")
    end

    it "routes to #new" do
      get("/sivic_categoria/new").should route_to("sivic_categoria#new")
    end

    it "routes to #show" do
      get("/sivic_categoria/1").should route_to("sivic_categoria#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_categoria/1/edit").should route_to("sivic_categoria#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_categoria").should route_to("sivic_categoria#create")
    end

    it "routes to #update" do
      put("/sivic_categoria/1").should route_to("sivic_categoria#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_categoria/1").should route_to("sivic_categoria#destroy", :id => "1")
    end

  end
end
