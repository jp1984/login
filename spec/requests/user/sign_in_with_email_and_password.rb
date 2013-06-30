require "spec_helper"

feature "sign in with email and password" do
  given(:user) { create(:user)}

  scenario "Sign in with email and password" do

    visit new_user_session_path
    fill_in "user[email]",    with: user.email
    fill_in "user[password]", with: user.password

    click_button "Sign in"

    expect(page).to have_content("Signed in successfully.")
    expect(current_path).to eql(root_path)

  end

  scenario "Sign in with invalid data" do
    visit new_user_session_path
    fill_in "user[email]", with: "j@p.com"
    fill_in "user[password]", with: "";

    click_button "Sign in"

    expect(page).to have_content("Invalid email or password.")
    expect(current_path).to eql(new_user_session_path)
  end

end
