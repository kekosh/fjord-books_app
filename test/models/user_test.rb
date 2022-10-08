# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should_return_email-address_if_name_nothing" do
    user = User.new(name: '', email:'foo@example.com')
    assert_equal('foo@example.com', user.name_or_email)
  end

  test "shold_return_name_if_name_filed" do
    user = User.new(name: "Bar bar", email: "bar@example.com")
    assert_equal('Bar bar', user.name_or_email)
  end

  test "should_can_follow_other_user" do
    follower = User.create(name:"Alice", email:"alice@example.com", password:"password")
    followed = User.create(name:"Bob", email:"bob@example.com", password:"password")

    assert_not follower.following?(followed)
    follower.follow(followed)
    assert follower.following?(followed)
  end

  test "should_can_show_followed_users" do
    followed_alice = User.create(name:"Alice", email:"alice@example.com", password:"password")
    follower_bob = User.create(name:"Bob", email:"bob@example.com", password:"password")
    follower_carol = User.create(name:"Carol", email:"carol@example.com", password:"password")

    assert_not followed_alice.followed_by?(follower_bob)
    assert_not followed_alice.followed_by?(follower_carol)
    follower_bob.follow(followed_alice)
    follower_carol.follow(followed_alice)
    assert followed_alice.followed_by?(follower_bob)
    assert followed_alice.followed_by?(follower_carol)
  end

  test "follower_can_unfollow" do
    follower = User.create(name:"Alice", email:"alice@example.com", password:"password")
    followed = User.create(name:"Bob", email:"bob@example.com", password:"password")
    follower.follow(followed)
    assert followed.followed_by?(follower)

    follower.unfollow(followed)
    assert_not followed.followed_by?(follower)
  end
end
