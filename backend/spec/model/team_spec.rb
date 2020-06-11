require 'rails_helper'

RSpec.describe Team, :type => :model do
  it "is valid with valid attributes" do
    expect(build(:team)).to be_valid
  end
  it { should have_many(:players) }
  it { should validate_length_of(:abbreviation).is_at_most(3) }
  it { should validate_uniqueness_of(:abbreviation) }
end
