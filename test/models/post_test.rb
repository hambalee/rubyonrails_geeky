require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @one = posts(:one)
    # @john = writer(:john)
    @john = writers(:john)
  end

  def test_belongs_to
    assert_equal @one.writer.id, @john.id
  end

  # def test_count
  #   assert_equal Post.count, 2
  # end

  # def test_title
  #   assert_equal @one.title, "My Post 1"
  # end

  # def test_body
  #   assert_equal @one.body, "My Text"
  # end
end
