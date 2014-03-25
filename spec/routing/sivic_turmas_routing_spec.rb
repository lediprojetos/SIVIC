require "spec_helper"

describe SivicTurmasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_turmas").should route_to("sivic_turmas#index")
    end

    it "routes to #new" do
      get("/sivic_turmas/new").should route_to("sivic_turmas#new")
    end

    it "routes to #show" do
      get("/sivic_turmas/1").should route_to("sivic_turmas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_turmas/1/edit").should route_to("sivic_turmas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_turmas").should route_to("sivic_turmas#create")
    end

    it "routes to #update" do
      put("/sivic_turmas/1").should route_to("sivic_turmas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_turmas/1").should route_to("sivic_turmas#destroy", :id => "1")
    end

  end
end
