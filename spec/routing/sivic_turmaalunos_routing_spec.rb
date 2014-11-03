require "spec_helper"

describe SivicTurmaalunosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_turmaalunos").should route_to("sivic_turmaalunos#index")
    end

    it "routes to #new" do
      get("/sivic_turmaalunos/new").should route_to("sivic_turmaalunos#new")
    end

    it "routes to #show" do
      get("/sivic_turmaalunos/1").should route_to("sivic_turmaalunos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_turmaalunos/1/edit").should route_to("sivic_turmaalunos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_turmaalunos").should route_to("sivic_turmaalunos#create")
    end

    it "routes to #update" do
      put("/sivic_turmaalunos/1").should route_to("sivic_turmaalunos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_turmaalunos/1").should route_to("sivic_turmaalunos#destroy", :id => "1")
    end

  end
end
