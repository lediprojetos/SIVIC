require "spec_helper"

describe SivicNotaalunosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_notaalunos").should route_to("sivic_notaalunos#index")
    end

    it "routes to #new" do
      get("/sivic_notaalunos/new").should route_to("sivic_notaalunos#new")
    end

    it "routes to #show" do
      get("/sivic_notaalunos/1").should route_to("sivic_notaalunos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_notaalunos/1/edit").should route_to("sivic_notaalunos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_notaalunos").should route_to("sivic_notaalunos#create")
    end

    it "routes to #update" do
      put("/sivic_notaalunos/1").should route_to("sivic_notaalunos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_notaalunos/1").should route_to("sivic_notaalunos#destroy", :id => "1")
    end

  end
end
