require "spec_helper"

describe "repositories/index.html.haml" do
  let(:repository) { stub_model(Repository,  url: "user/repo_example.git") }
  let(:repository2) { stub_model(Repository, url: "user/repo_example2.git") }
  before do
    assign(:repositories, [
      repository,
      repository2
    ])

    render
  end

  it "displays all repositories name" do
    expect(rendered).to have_content "user/repo_example"
    expect(rendered).to have_content "user/repo_example2"
  end

  it "shows a link to new repository" do
    expect(rendered).to have_link 'New repository'
  end

  it 'repositories have a link to their page' do
    expect(rendered).to have_link 'user/repo_example'
  end
end