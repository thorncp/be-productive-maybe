require "rails_helper"

RSpec.feature "User updates task" do
  include ActionView::RecordIdentifier

  context "with valid data" do
    scenario "and sees the updates task" do
      user = create(:user)
      task = create(:task, user: user, description: "old thing")
      tasks_page = TasksPage.new

      visit root_path(as: user)
      within "##{dom_id(task)}" do
        fill_in "task_description", with: "new thing"
        click_on "Update"
      end

      expect(tasks_page).to have_task("new thing")
    end
  end

  context "with invalid data" do
    scenario "and sees an error message" do
      user = create(:user)
      task = create(:task, user: user, description: "old thing")
      tasks_page = TasksPage.new

      visit root_path(as: user)
      within "##{dom_id(task)}" do
        fill_in "task_description", with: ""
        click_on "Update"
      end

      expect(tasks_page).to have_task("old thing")
    end
  end
end
