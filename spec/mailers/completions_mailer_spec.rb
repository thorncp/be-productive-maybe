require "rails_helper"

RSpec.describe CompletionsMailer do
  describe "#notify" do
    it "notifies the user to complete the given task" do
      task = create(:task)

      mail = CompletionsMailer.notify(task)

      expect(mail.subject).to eq t(
        "completions_mailer.notify.subject",
        description: task.description,
      )
      expect(mail.to).to eq [task.user.email]
      expect(mail.body).to include task_completion_url(task)
    end
  end
end
