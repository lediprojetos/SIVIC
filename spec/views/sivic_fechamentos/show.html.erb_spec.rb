require 'spec_helper'

describe "sivic_fechamentos/show" do
  before(:each) do
    @sivic_fechamento = assign(:sivic_fechamento, stub_model(SivicFechamento,
      :sivic_igreja => nil,
      :desc_fechamento => "Desc Fechamento",
      :valr_fechamento => "9.99",
      :tipo_fechamento => 1,
      :User => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Desc Fechamento/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
    rendered.should match(//)
  end
end
