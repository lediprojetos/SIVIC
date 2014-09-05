require 'spec_helper'

describe "SivicInscricaos" do
  describe "GET /sivic_inscricaos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sivic_inscricaos_path
      response.status.should be(200)
    end
  end
end
