require 'spec_helper'

describe "sivic_alunoaulas/show" do
  before(:each) do
    @sivic_alunoaula = assign(:sivic_alunoaula, stub_model(SivicAlunoaula,
      :sivic_turmaaluno => nil,
      :sivic_aula => nil,
      :flag_ausente => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
