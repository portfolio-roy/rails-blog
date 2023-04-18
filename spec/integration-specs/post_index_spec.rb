require 'rails_helper'

RSpec.describe 'User posts', type: :feature do
  let(:user) { create(:user) }
  let(:other_user) { create(:user) }

  before do
    10.times do |i|
      user.posts.create(title: "Post #{i + 1}", text: "This is the text for post #{i + 1}")
    end
  end

  it 'shows the user profile picture and username' do
    visit user_posts_path(user)

    expect(page).to have_css('img.user-photo')
    expect(page).to have_content(user.name)
  end

  it 'shows the number of posts for the user' do
    visit user_posts_path(user)

    expect(page).to have_content("Number of posts: #{user.posts.count}")
  end

  it 'shows a post title and truncated text' do
    visit user_posts_path(user)

    post = user.posts.first
    expect(page).to have_content(post.title)
    expect(page).to have_content(truncate(post.text, length: 200))
  end

  it 'shows the first comments on a post and comment count' do
    post = user.posts.first
    post.comments.create(text: "First comment on post", author: other_user)

    visit user_posts_path(user)

    expect(page).to have_content("Comments: #{post.comments.count}")
    expect(page).to have_content("First comment on post")
  end

  it 'shows the number of likes a post has' do
    post = user.posts.first
    post.likes.create(user: other_user)

    visit user_posts_path(user)

    expect(page).to have_content("Likes: #{post.likes.count}")
  end

  it 'shows pagination if there are more posts than fit on the view' do
    visit user_posts_path(user)

    expect(page).to have_css('.pagination')
  end

  it 'redirects to post show page when clicked' do
    post = user.posts.first

    visit user_posts_path(user)
    find("a[href='#{user_post_path(user, post)}']").click

    expect(current_path).to eq(user_post_path(user, post))
  end
end
