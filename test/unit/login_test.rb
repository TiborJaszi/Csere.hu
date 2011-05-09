require 'test_helper'

class LoginTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
  
  test "email null" do
    u = Login.new
    u.email = 'tibor.jaszi@gmail.com'
    assert !u.save, "Bajvan"
  end
end