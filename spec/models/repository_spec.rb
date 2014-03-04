require 'spec_helper'

describe Repository do
  it "not have two of the same repository" do
    repository = create(:repository)
    repository2 = build(:repository)

    expect(repository2).to_not be_valid
  end

  it "have the method details" do
    repository = create(:repository)
    create(:method_detail, repository: repository)

    expect(repository.method_details).to have(1).item
  end
end