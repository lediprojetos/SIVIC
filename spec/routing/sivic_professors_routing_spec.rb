require "spec_helper"

describe SivicProfessorsController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_professors").should route_to("sivic_professors#index")
    end

    it "routes to #new" do
      get("/sivic_professors/new").should route_to("sivic_professors#new")
    end

    it "routes to #show" do
      get("/sivic_professors/1").should route_to("sivic_professors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_professors/1/edit").should route_to("sivic_professors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_professors").should route_to("sivic_professors#create")
    end

    it "routes to #update" do
      put("/sivic_professors/1").should route_to("sivic_professors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_professors/1").should route_to("sivic_professors#destroy", :id => "1")
    end

  end
end
