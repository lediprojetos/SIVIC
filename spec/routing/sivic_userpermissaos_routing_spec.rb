require "spec_helper"

describe SivicUserpermissaosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_userpermissaos").should route_to("sivic_userpermissaos#index")
    end

    it "routes to #new" do
      get("/sivic_userpermissaos/new").should route_to("sivic_userpermissaos#new")
    end

    it "routes to #show" do
      get("/sivic_userpermissaos/1").should route_to("sivic_userpermissaos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_userpermissaos/1/edit").should route_to("sivic_userpermissaos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_userpermissaos").should route_to("sivic_userpermissaos#create")
    end

    it "routes to #update" do
      put("/sivic_userpermissaos/1").should route_to("sivic_userpermissaos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_userpermissaos/1").should route_to("sivic_userpermissaos#destroy", :id => "1")
    end

  end
end
