require 'rails_helper'

RSpec.describe "experts/index", type: :view do
  before(:each) do
    assign(:experts, [
      Expert.create!(
        name: "Name",
        url: "Url"
      ),
      Expert.create!(
        name: "Name",
        url: "Url"
      )
    ])
  end

  it "renders a list of experts" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Url".to_s, count: 2
  end
end
