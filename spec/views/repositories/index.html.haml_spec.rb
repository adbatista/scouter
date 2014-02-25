require "spec_helper"

describe "repositories/index.html.haml" do
  let(:repository) { stub_model(Repository, url: "repo_example.git") }
  let(:repository2) { stub_model(Repository, url: "repo_example2.git") }
  before do
    assign(:repositories, [
      repository,
      repository2
    ])
  end

  it "displays all repositories url" do
    render
    expect(rendered).to have_content "repo_example.git"
    expect(rendered).to have_content "repo_example2.git"
  end

  it "shows a link to new repository" do
    render
    expect(rendered).to have_link 'New repository'
  end

  it 'repositories have a link to their page' do
    render
    expect(rendered).to have_link 'show'
  end
end