require "rails_helper"

RSpec.describe Task do
  describe "associations" do
    it { should belong_to(:user) }
    it { should have_many(:completions).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:description) }
  end
end
