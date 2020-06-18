require 'rails_helper'

RSpec.describe "experts/show", type: :view do
  before(:each) do
    @expert = assign(:expert, Expert.create!(
      name: "Name",
      url: "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Url/)
  end
end
