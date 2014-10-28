require 'spec_helper'

describe "sivic_permissaos/show" do
  before(:each) do
    @sivic_permissao = assign(:sivic_permissao, stub_model(SivicPermissao,
      :mome_model => "Mome Model",
      :mumr_acao => 1,
      :desc_permissao => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Mome Model/)
    rendered.should match(/1/)
    rendered.should match(/MyText/)
  end
end
