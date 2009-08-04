require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end

  test "calculate ups" do
    ps = PaperStock.new(:parent_sheet => "28x40")
    ps.save


    section = Section.new(:paper_stock_id => 1, :out => 2, :finish_flat_size => "8.5x11")
    assert_equal section.calculate_ups, 2
  end
end
