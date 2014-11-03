require "spec_helper"

describe SivicCursosController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_cursos").should route_to("sivic_cursos#index")
    end

    it "routes to #new" do
      get("/sivic_cursos/new").should route_to("sivic_cursos#new")
    end

    it "routes to #show" do
      get("/sivic_cursos/1").should route_to("sivic_cursos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_cursos/1/edit").should route_to("sivic_cursos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_cursos").should route_to("sivic_cursos#create")
    end

    it "routes to #update" do
      put("/sivic_cursos/1").should route_to("sivic_cursos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_cursos/1").should route_to("sivic_cursos#destroy", :id => "1")
    end

  end
end
