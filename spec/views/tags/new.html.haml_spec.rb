require 'rails_helper'

RSpec.describe "tags/new", type: :view do
  before(:each) do
    assign(:tag, Tag.new(
      tag: "MyString",
      url: "MyString",
      expert: nil
    ))
  end

  it "renders new tag form" do
    render

    assert_select "form[action=?][method=?]", tags_path, "post" do

      assert_select "input[name=?]", "tag[tag]"

      assert_select "input[name=?]", "tag[url]"

      assert_select "input[name=?]", "tag[expert_id]"
    end
  end
end
