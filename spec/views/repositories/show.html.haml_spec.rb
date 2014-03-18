require "spec_helper"

describe "repositories/show.html.haml" do
  before do
    class_details =[
      stub_model(ClassDetail, class_name: "Example1", score: 10.1),
      stub_model(ClassDetail, class_name: "Example2", score: 9.1)
    ]
    assign :repository, stub_model(Repository, url: "repo_example.git", class_details: class_details)

    render
  end

  it "show repositories link" do
    expect(rendered).to have_link 'repositories'
  end

  it "show repository url" do
    expect(rendered).to have_content "repo_example.git"
  end

  it "show method details list" do
    expect(rendered).to have_content('Example1')
    expect(rendered).to have_content('Example2')
  end
end