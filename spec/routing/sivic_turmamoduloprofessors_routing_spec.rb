require "spec_helper"

describe SivicTurmamoduloprofessorsController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_turmamoduloprofessors").should route_to("sivic_turmamoduloprofessors#index")
    end

    it "routes to #new" do
      get("/sivic_turmamoduloprofessors/new").should route_to("sivic_turmamoduloprofessors#new")
    end

    it "routes to #show" do
      get("/sivic_turmamoduloprofessors/1").should route_to("sivic_turmamoduloprofessors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_turmamoduloprofessors/1/edit").should route_to("sivic_turmamoduloprofessors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_turmamoduloprofessors").should route_to("sivic_turmamoduloprofessors#create")
    end

    it "routes to #update" do
      put("/sivic_turmamoduloprofessors/1").should route_to("sivic_turmamoduloprofessors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_turmamoduloprofessors/1").should route_to("sivic_turmamoduloprofessors#destroy", :id => "1")
    end

  end
end
