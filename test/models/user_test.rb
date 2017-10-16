require_relative '../test_helper'

class UserTest < ActiveSupport::TestCase

  self.use_instantiated_fixtures = true

  test "user count" do
    assert_equal 1, User.count
  end

  test "fixture valid" do
    assert @sarah.valid?
  end

  test "user does not save without email" do
    @sarah.email = nil
    refute @sarah.valid?
    assert_not_nil @sarah.errors[:email]
  end

  test "user does not save without password" do
    @sarah.password = nil
    refute @sarah.save
  end

  test "no two users can have same email" do
    andy = User.new(email: "test@example.com", password: "n00b")
    refute andy.valid?
    assert_not_nil andy.errors[:email]
  end

  test "user can have courses" do
    assert_equal @sarah.courses.first, @course
    assert @sarah.courses
  end


end
