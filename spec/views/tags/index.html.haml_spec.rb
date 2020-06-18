require 'rails_helper'

RSpec.describe "tags/index", type: :view do
  before(:each) do
    assign(:tags, [
      Tag.create!(
        tag: "Tag",
        url: "Url",
        expert: nil
      ),
      Tag.create!(
        tag: "Tag",
        url: "Url",
        expert: nil
      )
    ])
  end

  it "renders a list of tags" do
    render
    assert_select "tr>td", text: "Tag".to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
