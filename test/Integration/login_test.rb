#Encoding: UTF-8
require 'test_helper'

class CorrectATaskTest < ActionDispatch::IntegrationTest
  fixtures :all

  # Replace this with your real tests.
  #test "the truth" do
#    assert true
  #end
  test "correct a login" do
    get url_for(:controller=>"login", :action=>"login")
    assert_response :success
    assert_select "h1", "Bejelentkezés"
    post_via_redirect '/login/create', :email=>'tibor.jaszi@gmail.com', :password=>'haho'
    assert_equal users(:admin).id, session[:user]
    assert_select "h2", users(:admin).email
    get url_for(:controller=>"product", :action=>"index")
    assert_select "table" do
      assert_select "tr", 1..6
    end
  end
end
