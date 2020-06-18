require 'rails_helper'

RSpec.describe "tags/show", type: :view do
  before(:each) do
    @tag = assign(:tag, Tag.create!(
      tag: "Tag",
      url: "Url",
      expert: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Tag/)
    expect(rendered).to match(/Url/)
    expect(rendered).to match(//)
  end
end
