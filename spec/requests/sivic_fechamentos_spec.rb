require 'spec_helper'

describe "SivicFechamentos" do
  describe "GET /sivic_fechamentos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sivic_fechamentos_path
      response.status.should be(200)
    end
  end
end
