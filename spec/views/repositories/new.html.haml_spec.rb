require "spec_helper"

describe "repositories/new.html.haml" do
  before do
    assign :repository, stub_model(Repository)
  end
  it "show repository url" do
    render
    expect(rendered).to have_selector 'form input[type="url"]'
  end

  it "show back link" do
    render
    expect(rendered).to have_link 'back'
  end
end