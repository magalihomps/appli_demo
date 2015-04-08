require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "User exemple", email: "user@exemple.com", password: "blabla", password_confirmation: "blabla")
  end

  test "doit être valide" do
    assert @user.valid?
  end

  test "le nom doit être rempli" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "l'email gdoit être rempli" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "le nom ne doit pas être trop long" do
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "le mail ne doit pas être trop long" do
    @user.email = "a" * 244 + "@exemple.com"
    assert_not @user.valid?
  end

  test "la validation du mail doit accepter les adresses valides" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "la validation du mail doit rejeter les adresses invalides" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "l'adresse mail doit être unique" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "le mot de passe doit faire au minimum 6 caractères" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end

end
