require "spec_helper"

describe SivicFechamentosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_fechamentos").should route_to("sivic_fechamentos#index")
    end

    it "routes to #new" do
      get("/sivic_fechamentos/new").should route_to("sivic_fechamentos#new")
    end

    it "routes to #show" do
      get("/sivic_fechamentos/1").should route_to("sivic_fechamentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_fechamentos/1/edit").should route_to("sivic_fechamentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_fechamentos").should route_to("sivic_fechamentos#create")
    end

    it "routes to #update" do
      put("/sivic_fechamentos/1").should route_to("sivic_fechamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_fechamentos/1").should route_to("sivic_fechamentos#destroy", :id => "1")
    end

  end
end
