require 'spec_helper'

describe Repository do
  it "not have two of the same repository" do
    repository = create(:repository)
    repository2 = build(:repository)

    expect(repository2).to_not be_valid
  end
end