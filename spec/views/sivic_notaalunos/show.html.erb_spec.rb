require 'spec_helper'

describe "sivic_notaalunos/show" do
  before(:each) do
    @sivic_notaaluno = assign(:sivic_notaaluno, stub_model(SivicNotaaluno,
      :nota => "",
      :sivic_licao => nil,
      :sivic_turmaaluno => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
  end
end
