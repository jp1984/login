require "spec_helper"

feature "sign up with email and password" do
  scenario "sign up with valid data" do
    visit new_user_registration_path
    fill_in "user[email]", with: "j@p.com"
    fill_in "user[password]", with: "123123123"
    fill_in "user[password_confirmation]", with: "123123123"

    click_button "Sign up"

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(current_path).to eql(root_path)
    expect(User.count).to eql(1)
  end
end
