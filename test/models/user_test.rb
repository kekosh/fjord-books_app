# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should_return_email-address_if_name_nothing' do
    user = User.new(name: '', email: 'foo@example.com')
    assert_equal('foo@example.com', user.name_or_email)
  end

  test 'shold_return_name_if_name_filed' do
    user = User.new(name: 'Bar bar', email: 'bar@example.com')
    assert_equal('Bar bar', user.name_or_email)
  end

  test 'can_follow_other_user' do
    follower = User.create!(name: 'Gori', email: 'gori@example.com', password: 'password')
    followed = User.create!(name: 'Dave', email: 'dave@example.com', password: 'password')

    assert_not follower.following?(followed)
    follower.follow(followed)
    assert follower.following?(followed)
  end

  test 'can_show_followed_users' do
    followed_edy = User.create!(name: 'Edy', email: 'edy@example.com', password: 'password')
    follower_fanis = User.create!(name: 'Fanis', email: 'fanis@example.com', password: 'password')
    follower_gori = User.create!(name: 'Gori', email: 'Gori@example.com', password: 'password')

    assert_not followed_edy.followed_by?(follower_fanis)
    assert_not followed_edy.followed_by?(follower_gori)
    follower_fanis.follow(followed_edy)
    follower_gori.follow(followed_edy)
    assert followed_edy.followed_by?(follower_fanis)
    assert followed_edy.followed_by?(follower_gori)
  end

  test 'follower_can_unfollow' do
    follower = User.create!(name: 'Edy', email: 'edy@example.com', password: 'password')
    followed = User.create!(name: 'Fanis', email: 'fanis@example.com', password: 'password')
    follower.follow(followed)
    assert followed.followed_by?(follower)

    follower.unfollow(followed)
    assert_not followed.followed_by?(follower)
  end
end
