require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get accueil" do
    get :accueil
    assert_response :success
    assert_select "title", "Accueil | Ruby on Rails Tutoriel Application Demo"
  end

  test "should get aide" do
    get :aide
    assert_response :success
    assert_select "title", "Aide | Ruby on Rails Tutoriel Application Demo"
  end

  test "should get a_propos" do
    get :a_propos
    assert_response :success
    assert_select "title", "A propos | Ruby on Rails Tutoriel Application Demo"
  end

end
