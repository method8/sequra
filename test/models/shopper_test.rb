require 'test_helper'

class ShopperTest < ActiveSupport::TestCase

  test "not all fields are present" do
    assert_not Shopper.new().save
  end

  test "invalid email address" do
    shopper = Shopper.new(id: 3, name: 'Moira', email: 'invalidemailaddress', nif: '411111392Z')
    refute shopper.valid?, 'email is valid'
    assert_not_nil shopper.errors[:email], 'no validation error for email present'
  end

  test "invalid nif" do
    shopper = Shopper.new(id: 3, name: 'Moira', email: 'moira@gmail.com', nif: 'AAA1392Z')
    refute shopper.valid?, 'nif is valid'
    assert_not_nil shopper.errors[:email], 'no validation error for nif present'
  end

end
