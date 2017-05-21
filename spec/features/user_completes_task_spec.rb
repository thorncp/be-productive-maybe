require "rails_helper"

RSpec.feature "User completes task" do
  scenario "by following the completion link" do
    task = create(:task)

    visit task_completion_path(task, as: task.user)

    expect(page).to have_text t("completions.success")
  end
end
