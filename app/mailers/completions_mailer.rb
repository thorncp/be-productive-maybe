class CompletionsMailer < ApplicationMailer
  def notify(task)
    @task = task
    mail(
      to: task.user.email,
      subject: t(".notify.subject", description: task.description),
    )
  end
end
