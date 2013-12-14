require "spec_helper"

describe SivicTipoEventosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_tipo_eventos").should route_to("sivic_tipo_eventos#index")
    end

    it "routes to #new" do
      get("/sivic_tipo_eventos/new").should route_to("sivic_tipo_eventos#new")
    end

    it "routes to #show" do
      get("/sivic_tipo_eventos/1").should route_to("sivic_tipo_eventos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_tipo_eventos/1/edit").should route_to("sivic_tipo_eventos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_tipo_eventos").should route_to("sivic_tipo_eventos#create")
    end

    it "routes to #update" do
      put("/sivic_tipo_eventos/1").should route_to("sivic_tipo_eventos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_tipo_eventos/1").should route_to("sivic_tipo_eventos#destroy", :id => "1")
    end

  end
end
