require "test_helper"

class PostTest < ActiveSupport::TestCase
  def setup
    @one = posts(:one)
    @john = writer(:john)
  end

  def test_belongs_to
    assert_equal @one.writer.id, @john.id
  end
end
