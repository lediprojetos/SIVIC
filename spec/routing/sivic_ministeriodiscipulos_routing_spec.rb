require "spec_helper"

describe SivicMinisteriodiscipulosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_ministeriodiscipulos").should route_to("sivic_ministeriodiscipulos#index")
    end

    it "routes to #new" do
      get("/sivic_ministeriodiscipulos/new").should route_to("sivic_ministeriodiscipulos#new")
    end

    it "routes to #show" do
      get("/sivic_ministeriodiscipulos/1").should route_to("sivic_ministeriodiscipulos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_ministeriodiscipulos/1/edit").should route_to("sivic_ministeriodiscipulos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_ministeriodiscipulos").should route_to("sivic_ministeriodiscipulos#create")
    end

    it "routes to #update" do
      put("/sivic_ministeriodiscipulos/1").should route_to("sivic_ministeriodiscipulos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_ministeriodiscipulos/1").should route_to("sivic_ministeriodiscipulos#destroy", :id => "1")
    end

  end
end
