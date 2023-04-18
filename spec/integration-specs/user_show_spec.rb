require 'rails_helper'

RSpec.feature 'User show page', type: :feature do
  let!(:user) { create(:user) }

  before do
    3.times { create(:post, user: user) }
    visit user_path(user)
  end

  scenario 'shows user information' do
    expect(page).to have_css("img[src*='#{user.photo}']")
    expect(page).to have_content(user.name)
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
    expect(page).to have_content(user.bio)
  end

  scenario 'shows recent posts' do
    expect(page).to have_content('Recent Posts')
    expect(page).to have_css('.post', count: 3)

    within('.posts') do
      user.most_recent_posts.each do |post|
        expect(page).to have_link(post.title, href: user_post_path(user, post))
        expect(page).to have_content(post.text.truncate(200))
        expect(page).to have_content("Comments: #{post.comments_counter}")
        expect(page).to have_content("Likes: #{post.likes_counter}")
      end
    end
  end

  scenario 'shows all posts' do
    click_on 'See all posts'
    expect(page).to have_current_path(user_posts_path(user))
  end

  scenario 'clicks on a post' do
    post = user.most_recent_posts.first
    within('.posts') { click_on post.title }
    expect(page).to have_current_path(user_post_path(user, post))
  end
end
