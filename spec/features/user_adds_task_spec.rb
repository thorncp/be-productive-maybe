require "rails_helper"

RSpec.feature "User adds task" do
  context "with valid data" do
    scenario "and sees the created task" do
      user = create(:user)
      tasks_page = TasksPage.new

      visit root_path(as: user)
      fill_in "Task", with: "take out garbage"
      click_on "Create Task"

      expect(tasks_page).to have_task("take out garbage")
    end
  end

  context "with invalid data" do
    scenario "and sees an error message" do
      user = create(:user)

      visit root_path(as: user)
      click_on "Create Task"

      expect(page).to have_text "can't be blank"
    end
  end
end
