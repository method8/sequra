require 'test_helper'

class MerchantTest < ActiveSupport::TestCase

  test "not all fields are present" do
    assert_not Merchant.new().save
  end

  test "invalid email address" do
    merchant = Merchant.new(id: 3, name: 'Moira', email: 'invalidemailaddress', cif: 'B611111112')
    refute merchant.valid?, 'email is valid'
    assert_not_nil merchant.errors[:email], 'no validation error for email present'
  end

  test "invalid cif" do
    merchant = Merchant.new(id: 3, name: 'Moira', email: 'moira.tabone@gmail.com', cif: 'B61111111X')
    refute merchant.valid?, 'cif is valid'
    assert_not_nil merchant.errors[:email], 'no validation error for cif present'
  end

end
