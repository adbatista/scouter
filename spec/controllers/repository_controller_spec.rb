require 'spec_helper'

describe RepositoriesController do
  describe "GET 'show'" do
    it "returns http success" do
      repo = create(:repository, builds: [ create(:build, klasses: [ create(:klass) ] ) ])

      get 'show', id: repo.id
      expect(response).to be_success
    end

    it "redirect to home if repository not exists" do
      get 'show', id: -1
      expect(response).to redirect_to root_path
    end
  end

  describe "POST 'create'" do
    let(:repo_attr){ FactoryGirl.attributes_for :repository }

    it "redirect" do
      post 'create', repository: repo_attr

      expect(response).to be_redirect
    end

    context "url of existent repository" do
      it "show new repository page" do
      allow(subject).to receive(:process_and_assign_respository_data)
        create(:repository)

        post 'create', repository: repo_attr

        expect(response).to render_template(:new)
      end
    end
  end
end