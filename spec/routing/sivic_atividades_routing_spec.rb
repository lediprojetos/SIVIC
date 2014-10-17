require "spec_helper"

describe SivicAtividadesController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_atividades").should route_to("sivic_atividades#index")
    end

    it "routes to #new" do
      get("/sivic_atividades/new").should route_to("sivic_atividades#new")
    end

    it "routes to #show" do
      get("/sivic_atividades/1").should route_to("sivic_atividades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_atividades/1/edit").should route_to("sivic_atividades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_atividades").should route_to("sivic_atividades#create")
    end

    it "routes to #update" do
      put("/sivic_atividades/1").should route_to("sivic_atividades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_atividades/1").should route_to("sivic_atividades#destroy", :id => "1")
    end

  end
end
