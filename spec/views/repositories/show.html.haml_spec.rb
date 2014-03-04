require "spec_helper"

describe "repositories/show.html.haml" do
  before do
    method_details =[
      stub_model(MethodDetail, detail: "Example#method1"),
      stub_model(MethodDetail, detail: "Example#method2")
    ]
    assign :repository, stub_model(Repository, url: "repo_example.git", score: 12.4, method_details: method_details)
  end

  it "show repositories link" do
    render
    expect(rendered).to have_link 'repositories'
  end

  it "show repository url" do
    render
    expect(rendered).to have_content "repo_example.git"
  end

  context "complexity" do
    it "show repository score" do
      render
      expect(rendered).to have_content 12.4
    end

    it "show repositories link" do
      render
      expect(rendered).to have_link 'repositories'
    end

    it "show method details list" do
      render
      expect(rendered).to have_content('method1')
      expect(rendered).to have_content('method2')
    end
  end
end