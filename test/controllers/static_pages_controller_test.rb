require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase

  def setup
    @base_title = "Ruby on Rails Tutorial Application Démo"
  end

  test "should get accueil" do
    get :accueil
    assert_response :success
    assert_select "title", "Accueil | #{@base_title}"
  end

  test "should get aide" do
    get :aide
    assert_response :success
    assert_select "title", "Aide | #{@base_title}"
  end

  test "should get a_propos" do
    get :a_propos
    assert_response :success
    assert_select "title", "A propos | #{@base_title}"
  end

  test "should get contact" do
    get :contact
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end

end
