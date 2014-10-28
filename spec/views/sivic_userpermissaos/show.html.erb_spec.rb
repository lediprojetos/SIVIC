require 'spec_helper'

describe "sivic_userpermissaos/show" do
  before(:each) do
    @sivic_userpermissao = assign(:sivic_userpermissao, stub_model(SivicUserpermissao,
      :sivic_permissao => nil,
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
