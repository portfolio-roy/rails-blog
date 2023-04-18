require 'rails_helper'

RSpec.feature 'User index page' do
  scenario 'Viewing all users' do
    # Create some users to display on the index page
    user1 = User.create(name: 'Chris', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.', posts_counter: 0)
        user2 = User.create(name: 'Donald', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
            bio: 'Teacher from Mexico.', posts_counter: 0)
    
    # Visit the user index page
    visit root_path
    
    # Check that both users are displayed
    expect(page).to have_content(user1.name)
    expect(page).to have_content(user2.name)
    
    # Check that profile pictures are displayed
    expect(page).to have_css("img[src*='#{user1.photo}']")
    expect(page).to have_css("img[src*='#{user2.photo}']")
    
    # Check that the number of posts is displayed for each user
    expect(page).to have_content("Number of posts: #{user1.posts_counter}")
    expect(page).to have_content("Number of posts: #{user2.posts_counter}")
    
    # Click on the first user's link and verify that we are redirected to their show page
    click_link user1.name
    expect(current_path).to eq(user_path(user1))
  end
end
