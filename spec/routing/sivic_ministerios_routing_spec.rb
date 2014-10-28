require "spec_helper"

describe SivicMinisteriosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_ministerios").should route_to("sivic_ministerios#index")
    end

    it "routes to #new" do
      get("/sivic_ministerios/new").should route_to("sivic_ministerios#new")
    end

    it "routes to #show" do
      get("/sivic_ministerios/1").should route_to("sivic_ministerios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_ministerios/1/edit").should route_to("sivic_ministerios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_ministerios").should route_to("sivic_ministerios#create")
    end

    it "routes to #update" do
      put("/sivic_ministerios/1").should route_to("sivic_ministerios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_ministerios/1").should route_to("sivic_ministerios#destroy", :id => "1")
    end

  end
end
