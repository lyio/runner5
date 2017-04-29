require 'test_helper'

class ShoeTest < ActiveSupport::TestCase
  def setup
    @shoe = Shoe.new(
      {
        :name => "Foo", 
        :bought_when => Date.today, 
        :user_id => users(:one).id
      })
  end

  test "should be valid" do 
    assert @shoe.valid?
  end

  test "should be invalid without a name" do
    @shoe.name = nil
    assert_not @shoe.valid?
  end

  test "should be invalid without a date" do 
    @shoe.bought_when = nil
    assert_not @shoe.valid?
  end

  test "should return mileage" do
    run = runs(:one)
    run.shoe = @shoe
    run.user_id = @shoe.user_id
    run.save!
    
    assert_equal runs(:one).distance, @shoe.mileage
  end
end
