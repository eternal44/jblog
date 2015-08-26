require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'should create new post' do
    assert_routing({ path: 'posts', method: :post }, { controller: 'posts',
                                                       action: 'create' })
  end

  test 'should get post' do
    assert_routing '/posts/1', { controller: 'posts', action: 'show', id: '1' }
  end
end
