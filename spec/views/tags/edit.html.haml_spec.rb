require 'rails_helper'

RSpec.describe "tags/edit", type: :view do
  before(:each) do
    @tag = assign(:tag, Tag.create!(
      tag: "MyString",
      url: "MyString",
      expert: nil
    ))
  end

  it "renders the edit tag form" do
    render

    assert_select "form[action=?][method=?]", tag_path(@tag), "post" do

      assert_select "input[name=?]", "tag[tag]"

      assert_select "input[name=?]", "tag[url]"

      assert_select "input[name=?]", "tag[expert_id]"
    end
  end
end
