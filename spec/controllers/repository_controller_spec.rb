require 'spec_helper'

describe RepositoriesController do
  describe "GET 'show'" do
    it "returns http success" do
      repo = create(:repository)

      get 'show', id: repo.id
      expect(response).to be_success
    end

    it "redirect to home if repository not exists" do
      get 'show', id: -1
      expect(response).to redirect_to root_path
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      expect(response).to be_success
    end
  end

  describe "POST 'create'" do
    it "redirect" do
      post 'create', repository: {url: Rails.root.join('spec/support_files/example.git').to_s}
      expect(response).to be_redirect
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      expect(response).to be_success
    end
  end
end