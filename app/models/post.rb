class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :comments_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :title, presence: true, length: { maximum: 250 }
  
  def most_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def as_json(_options = {})
    {
      id:,
      title:,
      text:,
      author_id:,
      comments_counter:,
      likes_counter:
    }
  end

  after_create :update_posts_counter

  private

  def update_posts_counter
    author.update(posts_counter: author.posts.count)
  end

  
end
