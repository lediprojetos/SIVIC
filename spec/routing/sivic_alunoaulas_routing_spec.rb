require "spec_helper"

describe SivicAlunoaulasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_alunoaulas").should route_to("sivic_alunoaulas#index")
    end

    it "routes to #new" do
      get("/sivic_alunoaulas/new").should route_to("sivic_alunoaulas#new")
    end

    it "routes to #show" do
      get("/sivic_alunoaulas/1").should route_to("sivic_alunoaulas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_alunoaulas/1/edit").should route_to("sivic_alunoaulas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_alunoaulas").should route_to("sivic_alunoaulas#create")
    end

    it "routes to #update" do
      put("/sivic_alunoaulas/1").should route_to("sivic_alunoaulas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_alunoaulas/1").should route_to("sivic_alunoaulas#destroy", :id => "1")
    end

  end
end
