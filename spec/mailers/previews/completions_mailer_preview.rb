class CompletionsMailerPreview < ActionMailer::Preview
  def notify
    task = FactoryGirl.create(:task, description: "dust the living room")
    CompletionsMailer.notify(task)
  end
end
