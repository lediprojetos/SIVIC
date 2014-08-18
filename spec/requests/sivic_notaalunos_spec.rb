require 'spec_helper'

describe "SivicNotaalunos" do
  describe "GET /sivic_notaalunos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sivic_notaalunos_path
      response.status.should be(200)
    end
  end
end
