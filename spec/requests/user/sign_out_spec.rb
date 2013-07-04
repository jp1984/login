require "spec_helper"

feature "Sign out" do
  given(:user) { create(:user) }


  scenario "Sign out with user logged" do
    sign_in_with(user)

    click_link "Sign out"

    expect(page).to have_content "Signed out successfully."
    expect(current_path).to eql root_path
    #expect(current_user).to be_nil
  end


  scenario "Sign out without user logged" do
    visit "/"

    expect(page).to_not have_link "Sign out"
    expect(page).to have_link "Sign in"
    expect(page).to have_link "Sign up"
  end
end
