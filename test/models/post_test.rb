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

  def test_body
    assert_equal @one.body, "MyText asdfasdfasdfasdfasdfasdf"
  end

  def test_body_presence
    @one.body = "123456789"

    valid = @one.valid?
    message = @one.errors.first.full_message

    assert_equal valid, false
    assert_equal message, "Body must have more than 10 characters"
  end

  def test_body_nil
    @one.body = nil

    valid = @one.valid?
    message = @one.errors.first.full_message

    assert_equal valid, false
    assert_equal message, "Body can't be blank"
  end
end
