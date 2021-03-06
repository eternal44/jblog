require 'test_helper'
# require 'database_cleaner'


class PostsTest < ActionDispatch::IntegrationTest

  # for setup and tear down each time we run tests
  self.use_transactional_fixtures = false

  setup do
    # comment in if you want to run tests with selenium
    # Capybara.default_driver = :selenium
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

  test 'login successfully' do
    visit new_user_session_path
    assert page.has_field?('Email', type: 'email')
    assert page.has_content?('Forgot your password?')
    fill_in('Email', with: 'jyoun@gmail.com')
    fill_in('Password', with: 'password1234')
    find_button('Log in')
    click_on 'Log in'
    assert page.has_content?('Logout'), 'not logged in'
  end

  test 'create post as admin' do
    login_as(@admin)
    visit root_path
    assert page.has_link?('Logout'), 'not logged in'
    assert page.has_link?('New Post'), 'not logged in as admin'
    click_on('New Post')
    assert page.has_field?('Title', type: 'text'), 'not on new post page'
    fill_in('Title', with: 'Test Post')
    fill_in('Text', with: 'Just another post')
    click_on('Create Post')
    assert page.has_content?('Just another post'), 'new post not created'
  end

  test 'update post as admin' do
    login_as(@admin)
    visit post_path(@post)
    assert page.has_content?('Lorem ipsum'), 'not on post page'
    click_on('Edit')
    fill_in('Text', with: 'Apples')
    click_on('Update Post')
    assert page.has_content?('Apples')
  end
end
