require "spec_helper"

describe SivicPessoasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_pessoas").should route_to("sivic_pessoas#index")
    end

    it "routes to #new" do
      get("/sivic_pessoas/new").should route_to("sivic_pessoas#new")
    end

    it "routes to #show" do
      get("/sivic_pessoas/1").should route_to("sivic_pessoas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_pessoas/1/edit").should route_to("sivic_pessoas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_pessoas").should route_to("sivic_pessoas#create")
    end

    it "routes to #update" do
      put("/sivic_pessoas/1").should route_to("sivic_pessoas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_pessoas/1").should route_to("sivic_pessoas#destroy", :id => "1")
    end

  end
end
