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

  # attr_accessor :tags_string

  def tags_string
    # tags.map(&:name).join(', ')
    tags.pluck(:name).join(', ')
  end

  def tags_string=(value)
    # value = "game, movie"
    words = value.split(',').map{|s| s.strip.downcase}
    # ['game', 'movie']

    #
    existing_tags = tags.pluck(:name)
    words = words - existing_tags
    words.each do |word|
      # tag = Tag.new(name: word)
      # tag.save
    tag = Tag.find_or_create_by(name: word)

    tags << tag
    end
  end
end


# tag -> game, movie, drama
# posts -> posts_tags -> tags
# tags -> post_tags -> posts

# bundle exec rails g model tag name:string
# bundle exec rails g model post_tag tag:references post:references
# bundle exec rails db:migrate

# Post.joins(:writer).where('writers.id' => 2)
# Post.joins(:writer).group('writers.id')
# Post.joins(:tags).group('tags.name')
# Post.joins(:tags).group('tags.name').count
