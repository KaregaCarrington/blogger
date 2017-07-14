require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @user = users(:one)
    @post = @user.posts.build(title: "example", body: "lorem ipsum")
  end

  test "should be valid" do
    assert @post.valid?
  end

  test "title should be present" do
    @post.title = "    "
    assert_not @post.valid?
  end

  test "body should be present" do
    @post.body = "  "
    assert_not @post.valid?
  end

  test "should have a user id" do
    @post.user_id = nil
    assert_not @post.valid?
  end

  test "order should be most recent first" do
    assert_equal posts(:one), Post.first
  end
end
