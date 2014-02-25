require "spec_helper"

describe "repositories/show.html.haml" do
  before do
    assign :repository, stub_model(Repository, url: "repo_example.git", score: 12.4)
  end

  context "complexity" do
    it "show repository url" do
      render
      expect(rendered).to have_content "repo_example.git"
    end

    it "show repository score" do
      render
      expect(rendered).to have_content 12.4
    end

    it "show repositories link" do
      render
      expect(rendered).to have_link 'repositories'
    end
  end
end