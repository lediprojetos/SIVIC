require "spec_helper"

describe SivicAtividadepessoasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_atividadepessoas").should route_to("sivic_atividadepessoas#index")
    end

    it "routes to #new" do
      get("/sivic_atividadepessoas/new").should route_to("sivic_atividadepessoas#new")
    end

    it "routes to #show" do
      get("/sivic_atividadepessoas/1").should route_to("sivic_atividadepessoas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_atividadepessoas/1/edit").should route_to("sivic_atividadepessoas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_atividadepessoas").should route_to("sivic_atividadepessoas#create")
    end

    it "routes to #update" do
      put("/sivic_atividadepessoas/1").should route_to("sivic_atividadepessoas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_atividadepessoas/1").should route_to("sivic_atividadepessoas#destroy", :id => "1")
    end

  end
end
