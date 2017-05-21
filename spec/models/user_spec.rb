require "rails_helper"

RSpec.describe User do
  describe "associations" do
    it { should have_many(:tasks).dependent(:destroy) }
  end

  describe "#current_task" do
    context "when all tasks have previously been completed" do
      it "notifies the user of their least recently completed task" do
        user = create(:user)
        oldest_task = create(:task, user: user)
        newest_task = create(:task, user: user)
        create(:completion, task: newest_task, completed_at: 1.month.ago)
        create(:completion, task: newest_task, completed_at: 1.day.ago)
        create(:completion, task: oldest_task, completed_at: 1.month.ago)
        create(:completion, task: oldest_task, completed_at: 1.week.ago)

        task = user.current_task

        expect(task).to eq oldest_task
      end
    end

    context "when no tasks have previously been completed" do
      it "notifies the user of the oldest task" do
        user = create(:user)
        oldest_task = create(:task, user: user)
        create(:task, user: user)

        task = user.current_task

        expect(task).to eq oldest_task
      end
    end

    context "when some tasks have not been previously completed" do
      it "notifies the user of the oldest incomplete task" do
        user = create(:user)
        oldest_task = create(:task, user: user)
        oldest_incomplete_task = create(:task, user: user)
        create(:completion, task: oldest_task, completed_at: 1.week.ago)

        task = user.current_task

        expect(task).to eq oldest_incomplete_task
      end
    end

    context "when the user has no tasks" do
      it "is nill" do
        user = create(:user)

        expect(user.current_task).to be_nil
      end
    end
  end
end
