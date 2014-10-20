require 'spec_helper'

describe "sivic_periodicidadecons/show" do
  before(:each) do
    @sivic_periodicidadecon = assign(:sivic_periodicidadecon, stub_model(SivicPeriodicidadecon,
      :desc_periodicidade => "Desc Periodicidade",
      :numr_qtddia => 1,
      :sivic_igreja => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Desc Periodicidade/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
