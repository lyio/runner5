require 'test_helper'

class RunTest < ActiveSupport::TestCase

  def setup
    @run = runs(:one) 
    @run.user = users(:one)
    

    @second_run = runs(:two)
    @second_run.user = users(:two)
  end

  test "should be valid" do 
    assert @run.valid?
  end

  test "is invalid without user" do 
    @run.user = nil
    assert_not @run.valid?
  end

  test "is invalid without name" do 
    @run.name = nil
    assert_not @run.valid?
  end

  test "is invalid without date" do 
    @run.date = nil
    assert_not @run.valid?
  end

  test "is invalid without heartrate" do 
    @run.heartrate = nil
    assert_not @run.valid?
  end

  test "totals returns correct numbers for only one user" do 
    @run.save!
    @second_run.save!
    distance, count, time = Run.totals users(:one)

    assert_equal(1, count)
    assert_equal(@run.distance, distance)
    assert_equal(@run.format_duration, time)
  end

  test "overall_* methods return sum of both runs" do
    @run.save!

    assert_equal(@run.distance + @second_run.distance, Run.overall_distance)
    #assert_equal(2, Run.overall_count)
    assert_equal(@run.duration + @second_run.duration, Run.overall_time)
  end
end
