require "rails_helper"

RSpec.describe Completion do
  describe "associations" do
    it { should belong_to(:task) }
  end
end
