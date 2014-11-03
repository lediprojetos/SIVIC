require 'spec_helper'

describe "sivic_parteventos/show" do
  before(:each) do
    @sivic_partevento = assign(:sivic_partevento, stub_model(SivicPartevento,
      :sivic_pessoa => nil,
      :sivic_evento => nil,
      :sivic_movimentofinanceiro => nil,
      :FLAG_naoparticipou => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
  end
end
