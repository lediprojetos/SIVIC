require 'spec_helper'

describe "SivicContabancos" do
  describe "GET /sivic_contabancos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sivic_contabancos_path
      response.status.should be(200)
    end
  end
end
