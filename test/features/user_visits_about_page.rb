require 'spec_helper'

feature "User visits the about page" do
  # As a user I want to visit the about page to learn about the site

  it "sees a title" do
    visit '/about'
    expect(page).to have_content "MarkdUp"
  end
end
