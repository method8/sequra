require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "not all fields are present" do
    assert_not Order.new().save
  end

end
