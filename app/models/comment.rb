class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, presence: true, length: { maximum: 1000 }
  def as_json(_options = {})
    {
      id:,
      text:,
      author_id:,
      post_id:
    }
  end
  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
