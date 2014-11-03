require 'spec_helper'

describe "Observacoesrelatorios" do
  describe "GET /observacoesrelatorios" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get observacoesrelatorios_path
      response.status.should be(200)
    end
  end
end
