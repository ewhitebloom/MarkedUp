require 'spec_helper'

feature "User visits the root path and isn't signed in (or signed up)" do
  # As a user visits the root path, he will see the map, and all associated features.

  it "sees a title" do
    visit root_path
    expect(page).to have_content "MarkdUp"
  end

  it 'can navigate to about page' do
    click_on "About"
    expect(page).to have_content "Markdup is a "
  end

  it 'can navigate to signup page' do
    click_on 'Signup'
    expect(page).to have_content 'Signup'
  end

  it 'can signin' do
    click_on 'Signin'
  end

  it 'can signup' do
    visit '/users/new'
    fill_in 'First', with: 'John'
    fill_in 'Last', with: 'Smith'
    fill_in 'Address', with: '123 Candy Lane, Somerville, MA 02145'
  end

end