require 'test_helper'
require 'database_cleaner'

class PostsTest < ActionDispatch::IntegrationTest

  # for setup and tear down each time we run tests
  self.use_transactional_fixtures = false

  setup do
    DatabaseCleaner.start
  end

  teardown do
    DatabaseCleaner.clean
  end

  def setup
    @post = posts(:valid_post)
    @admin = users(:james)
    @regular = users(:steve)
  end

  test 'display comments' do
    assert @post.comments.first.body == 'hello'
  end

  test 'visit contact page' do
    visit '/contact'
    assert page.has_text?('jamesyoun710')
  end

  test 'login and create a post' do
    visit new_user_session_path
    assert page.has_field?('Email', type: 'email')
    fill_in('Email', with: 'jamesyoun710@gmail.com')
    fill_in('Password', with: 'gooneen44')
    click_on('Log in') # I should have been able to login with the above action # I should have been able to login with the above action
    # login_as(@admin)
    visit root_path
    assert page.has_link?('Logout')
    assert page.has_link?('New Post')
    click_on('New Post')
    assert page.has_field?('Title', type: 'text')
    fill_in('Title', with: 'Test Post')
    fill_in('Text', with: 'Just another post')
    click_on('Create Post')
    assert page.has_content?('Just another post')
  end
end
