require "spec_helper"

describe SivicContabancosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_contabancos").should route_to("sivic_contabancos#index")
    end

    it "routes to #new" do
      get("/sivic_contabancos/new").should route_to("sivic_contabancos#new")
    end

    it "routes to #show" do
      get("/sivic_contabancos/1").should route_to("sivic_contabancos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_contabancos/1/edit").should route_to("sivic_contabancos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_contabancos").should route_to("sivic_contabancos#create")
    end

    it "routes to #update" do
      put("/sivic_contabancos/1").should route_to("sivic_contabancos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_contabancos/1").should route_to("sivic_contabancos#destroy", :id => "1")
    end

  end
end
