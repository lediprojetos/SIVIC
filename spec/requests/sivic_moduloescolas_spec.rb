require 'spec_helper'

describe "SivicModuloescolas" do
  describe "GET /sivic_moduloescolas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sivic_moduloescolas_path
      response.status.should be(200)
    end
  end
end
