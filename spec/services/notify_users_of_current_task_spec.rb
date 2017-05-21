require "rails_helper"

RSpec.describe NotifyUsersOfCurrentTask do
  describe ".run" do
    context "when users have tasks" do
      it "notifies them of their current task" do
        task1, task2 = create_list(:task, 2)

        NotifyUsersOfCurrentTask.run

        mails = ActionMailer::Base.deliveries.last(2)
        expect(mails.flat_map(&:to)).to match_array [
          task1.user.email,
          task2.user.email,
        ]
        expect(mails.flat_map(&:subject)).to match_array [
          t(
            "completions_mailer.notify.subject",
            description: task1.description,
          ),
          t(
            "completions_mailer.notify.subject",
            description: task2.description,
          ),
        ]
      end
    end

    context "when a user does not have nay tasks" do
      it "does not send an email" do
        create(:user)

        NotifyUsersOfCurrentTask.run

        expect(ActionMailer::Base.deliveries.last).to be_nil
      end
    end
  end
end
