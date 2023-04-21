class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true, length: { maximum: 50 }
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :confirmable, :validatable

  def is?(requested_role)
    role == requested_role.to_s
  end

  def most_recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  def after_confirmation_path_for(_resource_name, _resource)
    root_path
  end
end
