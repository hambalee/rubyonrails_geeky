class Post < ApplicationRecord
  belongs_to :writer
  validates :body, presence: true

  validate :body_more_than_10

  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  def writer_name
    writer.name
  end

  def body_more_than_10
    if body.nil? || body.length < 10
      errors.add(:body, "must have more than 10 characters")
    end
  end
end


# tag -> game, movie, drama
# posts -> posts_tags -> tags
# tags -> post_tags -> posts

# bundle exec rails g model tag name:string
# bundle exec rails g model post_tag tag:references post:references
# bundle exec rails db:migrate
