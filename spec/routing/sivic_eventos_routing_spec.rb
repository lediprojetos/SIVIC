require "spec_helper"

describe SivicEventosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_eventos").should route_to("sivic_eventos#index")
    end

    it "routes to #new" do
      get("/sivic_eventos/new").should route_to("sivic_eventos#new")
    end

    it "routes to #show" do
      get("/sivic_eventos/1").should route_to("sivic_eventos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_eventos/1/edit").should route_to("sivic_eventos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_eventos").should route_to("sivic_eventos#create")
    end

    it "routes to #update" do
      put("/sivic_eventos/1").should route_to("sivic_eventos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_eventos/1").should route_to("sivic_eventos#destroy", :id => "1")
    end

  end
end
