require "spec_helper"

describe SivicFornecedorsController do
  describe "routing" do

    it "routes to #index" do
      get("/sivic_fornecedors").should route_to("sivic_fornecedors#index")
    end

    it "routes to #new" do
      get("/sivic_fornecedors/new").should route_to("sivic_fornecedors#new")
    end

    it "routes to #show" do
      get("/sivic_fornecedors/1").should route_to("sivic_fornecedors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sivic_fornecedors/1/edit").should route_to("sivic_fornecedors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sivic_fornecedors").should route_to("sivic_fornecedors#create")
    end

    it "routes to #update" do
      put("/sivic_fornecedors/1").should route_to("sivic_fornecedors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sivic_fornecedors/1").should route_to("sivic_fornecedors#destroy", :id => "1")
    end

  end
end
