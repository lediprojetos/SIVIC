require 'spec_helper'

describe "SivicContatos" do
  describe "GET /sivic_contatos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sivic_contatos_path
      response.status.should be(200)
    end
  end
end
