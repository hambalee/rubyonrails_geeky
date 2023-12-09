require "test_helper"

class WriterTest < ActiveSupport::TestCase
  def setup
    @writer = writers(:john)
  end

  def test_count
    assert_equal Writer.count, 2
  end

  def test_name
    assert_equal @writer.name, "John"
  end

  def test_age
    assert_equal @writer.age, 20
  end

  def test_has_many_posts
    assert_equal @writer.posts.count, 1
  end

  # def test_select_list
  #   list = [['John', @john.id], ['Junior', @junior.id]].sort_by{|name, id| id}
  #   assert_equal Writer.select_lists, list
  # end

  # def test_select_lists
  #   list = [[@writer.name, @writer.id]].sort_by { |name, id| id }
  #   assert_equal Writer.select_lists, list
  # end

  # def test_unique_name
  #   writer = Writer.new(name: "John", age: 21)

  #   assert_equal writer.valid?, false
  # end
end
