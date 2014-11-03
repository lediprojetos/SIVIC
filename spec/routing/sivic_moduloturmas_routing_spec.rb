require "spec_helper"

describe SivicModuloturmasController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_moduloturmas").should route_to("sivic_moduloturmas#index")
    end

    it "routes to #new" do
      get("/sivic_moduloturmas/new").should route_to("sivic_moduloturmas#new")
    end

    it "routes to #show" do
      get("/sivic_moduloturmas/1").should route_to("sivic_moduloturmas#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_moduloturmas/1/edit").should route_to("sivic_moduloturmas#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_moduloturmas").should route_to("sivic_moduloturmas#create")
    end

    it "routes to #update" do
      put("/sivic_moduloturmas/1").should route_to("sivic_moduloturmas#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_moduloturmas/1").should route_to("sivic_moduloturmas#destroy", :id => "1")
    end

  end
end
