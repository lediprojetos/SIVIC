require 'spec_helper'

describe "sivic_notaalunos/edit" do
  before(:each) do
    @sivic_notaaluno = assign(:sivic_notaaluno, stub_model(SivicNotaaluno,
      :nota => "",
      :sivic_licao => nil,
      :sivic_turmaaluno => nil,
      :user => nil
    ))
  end

  it "renders the edit sivic_notaaluno form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_notaaluno_path(@sivic_notaaluno), "post" do
      assert_select "input#sivic_notaaluno_nota[name=?]", "sivic_notaaluno[nota]"
      assert_select "input#sivic_notaaluno_sivic_licao[name=?]", "sivic_notaaluno[sivic_licao]"
      assert_select "input#sivic_notaaluno_sivic_turmaaluno[name=?]", "sivic_notaaluno[sivic_turmaaluno]"
      assert_select "input#sivic_notaaluno_user[name=?]", "sivic_notaaluno[user]"
    end
  end
end
