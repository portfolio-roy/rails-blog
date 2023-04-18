require 'rails_helper'

RSpec.describe 'User index page', type: :feature do
  let!(:users) { create_list(:user, 3) }

  it 'displays information about all users' do
    visit users_path

    # Verify that the page contains the usernames of all other users.
    users.each do |user|
      expect(page).to have_link(user.name, href: user_path(user))
    end

    # Verify that the page contains the profile picture for each user.
    users.each do |user|
      expect(page).to have_css("img[src*='#{user.photo}']")
    end

    # Verify that the page contains the number of posts each user has written.
    users.each do |user|
      expect(page).to have_content("Number of posts: #{user.posts.count}")
    end

    # Click on a user's name and verify that we are redirected to that user's show page.
    user = users.first
    click_link user.name
    expect(current_path).to eq(user_path(user))
  end
end
