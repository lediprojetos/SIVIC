require "spec_helper"

describe SivicLancamentosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_lancamentos").should route_to("sivic_lancamentos#index")
    end

    it "routes to #new" do
      get("/sivic_lancamentos/new").should route_to("sivic_lancamentos#new")
    end

    it "routes to #show" do
      get("/sivic_lancamentos/1").should route_to("sivic_lancamentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_lancamentos/1/edit").should route_to("sivic_lancamentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_lancamentos").should route_to("sivic_lancamentos#create")
    end

    it "routes to #update" do
      put("/sivic_lancamentos/1").should route_to("sivic_lancamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_lancamentos/1").should route_to("sivic_lancamentos#destroy", :id => "1")
    end

  end
end
