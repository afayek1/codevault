class Post < ActiveRecord::Base
  belongs_to :user
  has_many :tags, as: :taggable
  has_many :comments, as: :commentable
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :code, presence: true
  
  default_scope -> { order(created_at: :desc) }
  
end
