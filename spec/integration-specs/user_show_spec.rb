require 'rails_helper'

RSpec.describe "User show page" do
    let(:user) { User.create(name: 'Jenny', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Teacher from Mexico.', posts_counter: 0) }
  
  before { visit user_path(user) }
    
    it "displays the user's profile picture" do
      expect(page).to have_css("img[src*='#{user.photo}']")
    end
    
    it "displays the user's username" do
      expect(page).to have_content(user.username)
    end
    
    it "displays the number of posts the user has written" do
      expect(page).to have_content("Number of posts: #{user.posts.count}")
    end
    
    it "displays the user's bio" do
      expect(page).to have_content(user.bio)
    end
    
    it "displays the user's first 3 posts" do
      user.posts.limit(3).each do |post|
        expect(page).to have_link(post.title, href: post_path(post))
        expect(page).to have_content(post.body)
      end
    end
    
    it "has a button to view all of a user's posts" do
      expect(page).to have_link("View all posts", href: user_posts_path(user))
    end
    
    it "redirects to the post show page when a post is clicked" do
      post = user.posts.first
      click_link post.title
      expect(current_path).to eq(post_path(post))
    end
    
    it "redirects to the user's post index page when the view all posts button is clicked" do
      click_link "View all posts"
      expect(current_path).to eq(user_posts_path(user))
    end
  end
  