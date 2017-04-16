require 'test_helper'

class RunTypeTest < ActiveSupport::TestCase
  def setup
    @run_type = run_types(:one) 
  end

  test "should be valid" do 
    assert @run_type.valid?
  end

  test "should be invalid without name" do
    @run_type.name = nil
    assert_not @run_type.valid?
  end

  test "should be invalid without heartrate" do
    @run_type.heartrate = nil
    assert_not @run_type.valid?
  end
end