require 'spec_helper'

describe "SivicPartevenrelacelulas" do
  describe "GET /sivic_partevenrelacelulas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sivic_partevenrelacelulas_path
      response.status.should be(200)
    end
  end
end
