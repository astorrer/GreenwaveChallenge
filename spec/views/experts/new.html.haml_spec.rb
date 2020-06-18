require 'rails_helper'

RSpec.describe "experts/new", type: :view do
  before(:each) do
    assign(:expert, Expert.new(
      name: "MyString",
      url: "MyString"
    ))
  end

  it "renders new expert form" do
    render

    assert_select "form[action=?][method=?]", experts_path, "post" do

      assert_select "input[name=?]", "expert[name]"

      assert_select "input[name=?]", "expert[url]"
    end
  end
end
