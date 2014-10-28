require 'spec_helper'

describe "SivicTurmas" do
  describe "GET /sivic_turmas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sivic_turmas_path
      response.status.should be(200)
    end
  end
end
