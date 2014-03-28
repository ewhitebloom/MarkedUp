require 'spec_helper'

feature "User visits the root path, with the map and other features" do
  # As a user visits the root path, he will see the map, and all associated features.
  post1 = Post.create!(category: 'News', body: 'This is some post content.', latitude: 51.49271, longitude: -0.08995)

  it "sees a title" do
    visit root_path
    expect(page).to have_content "MarkdUp"
  end

  it "" do
  end
end
