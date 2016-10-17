require "rails_helper"

RSpec.feature "User signs up" do
  scenario "and is signed in afterwards" do
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    click_button "Sign up"

    expect(page).to have_button "Sign out"
  end
end
