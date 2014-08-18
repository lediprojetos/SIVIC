require 'spec_helper'

describe "sivic_notaalunos/new" do
  before(:each) do
    assign(:sivic_notaaluno, stub_model(SivicNotaaluno,
      :nota => "",
      :sivic_licao => nil,
      :sivic_turmaaluno => nil,
      :user => nil
    ).as_new_record)
  end

  it "renders new sivic_notaaluno form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", sivic_notaalunos_path, "post" do
      assert_select "input#sivic_notaaluno_nota[name=?]", "sivic_notaaluno[nota]"
      assert_select "input#sivic_notaaluno_sivic_licao[name=?]", "sivic_notaaluno[sivic_licao]"
      assert_select "input#sivic_notaaluno_sivic_turmaaluno[name=?]", "sivic_notaaluno[sivic_turmaaluno]"
      assert_select "input#sivic_notaaluno_user[name=?]", "sivic_notaaluno[user]"
    end
  end
end
