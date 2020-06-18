require 'rails_helper'

RSpec.describe "experts/edit", type: :view do
  before(:each) do
    @expert = assign(:expert, Expert.create!(
      name: "MyString",
      url: "MyString"
    ))
  end

  it "renders the edit expert form" do
    render

    assert_select "form[action=?][method=?]", expert_path(@expert), "post" do

      assert_select "input[name=?]", "expert[name]"

      assert_select "input[name=?]", "expert[url]"
    end
  end
end
