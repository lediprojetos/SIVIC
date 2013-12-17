require "spec_helper"

describe SivicEnderecosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_enderecos").should route_to("sivic_enderecos#index")
    end

    it "routes to #new" do
      get("/sivic_enderecos/new").should route_to("sivic_enderecos#new")
    end

    it "routes to #show" do
      get("/sivic_enderecos/1").should route_to("sivic_enderecos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_enderecos/1/edit").should route_to("sivic_enderecos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_enderecos").should route_to("sivic_enderecos#create")
    end

    it "routes to #update" do
      put("/sivic_enderecos/1").should route_to("sivic_enderecos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_enderecos/1").should route_to("sivic_enderecos#destroy", :id => "1")
    end

  end
end
