require "minitest/autorun"
require "./path"

class PathTest < Minitest::Test
  def test_read_file
    path = Path.new
    assert_equal path.read_file("paths.csv")[0], ["p9", "p3", "p6"]
  end

  def test_extract_history_sets
    path = Path.new
    csv = path.read_file('simple_paths.csv')
    assert_equal path.extract_history_sets, "p7p6p6p9"

    path = Path.new
    csv = path.read_file('instructions.csv')
    assert_equal path.extract_history_sets, "p2p3p2p3"
  end
end