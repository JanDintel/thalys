require 'test_helper'

class PostTest < ActiveSupport::TestCase
  def setup
    @post = Post.create(title: 'test', content: 'test')
  end

  test 'responders' do
    assert_respond_to @post, :title
  end
end
