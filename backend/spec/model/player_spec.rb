require 'rails_helper'

RSpec.describe Player, :type => :model do
  it "is valid with valid attributes" do
    expect(build(:player)).to be_valid
  end
  it { should belong_to(:team).without_validating_presence }
end
