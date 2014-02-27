require "spec_helper"

describe ObservacoesrelatoriosController do
  describe "routing" do

    it "routes to #index" do
      get("/observacoesrelatorios").should route_to("observacoesrelatorios#index")
    end

    it "routes to #new" do
      get("/observacoesrelatorios/new").should route_to("observacoesrelatorios#new")
    end

    it "routes to #show" do
      get("/observacoesrelatorios/1").should route_to("observacoesrelatorios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/observacoesrelatorios/1/edit").should route_to("observacoesrelatorios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/observacoesrelatorios").should route_to("observacoesrelatorios#create")
    end

    it "routes to #update" do
      put("/observacoesrelatorios/1").should route_to("observacoesrelatorios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/observacoesrelatorios/1").should route_to("observacoesrelatorios#destroy", :id => "1")
    end

  end
end
