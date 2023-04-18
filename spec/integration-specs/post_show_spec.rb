require 'rails_helper'

RSpec.feature "Post show page", type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @post = Post.create(author: first_user, title: 'Hello', text: 'This is my first post')
    Comment.create(post: first_post, author: second_user, text: 'Hi Tom!' )
  end

  scenario "User can see the post details and comments" do
    visit user_post_path(@user, @post)

    expect(page).to have_content(@post.title)
    expect(page).to have_content(@post.author.name)
    expect(page).to have_content("Comments: 2")
    expect(page).to have_content("Likes: 0")
    expect(page).to have_content(@post.text)

    # Check each commentor's name and comment
    @post.comments.each do |comment|
      expect(page).to have_content(comment.author.name)
      expect(page).to have_content(comment.text)
    end
  end

  scenario "User can like a post" do
    visit user_post_path(@user, @post)

    expect(page).to have_content("Likes: 0")

    click_button "Like post"

    expect(page).to have_content("Likes: 1")
  end

  scenario "User can add a comment" do
    visit user_post_path(@user, @post)

    expect(page).to have_content("Comments: 2")

    click_link "Comment"

    fill_in "comment_text", with: "This is my comment"
    click_button "Create Comment"

    expect(page).to have_content("Comments: 3")
    expect(page).to have_content("This is my comment")
  end
end
