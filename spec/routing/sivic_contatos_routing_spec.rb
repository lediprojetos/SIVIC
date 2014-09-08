require "spec_helper"

describe SivicContatosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_contatos").should route_to("sivic_contatos#index")
    end

    it "routes to #new" do
      get("/sivic_contatos/new").should route_to("sivic_contatos#new")
    end

    it "routes to #show" do
      get("/sivic_contatos/1").should route_to("sivic_contatos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_contatos/1/edit").should route_to("sivic_contatos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_contatos").should route_to("sivic_contatos#create")
    end

    it "routes to #update" do
      put("/sivic_contatos/1").should route_to("sivic_contatos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_contatos/1").should route_to("sivic_contatos#destroy", :id => "1")
    end

  end
end
