require "minitest/autorun"
require "./path"

class PathTest < Minitest::Test
  def test_read_file
    path = Path.new
    assert_equal path.read_file("paths.csv")[0], ["p9", "p3", "p6"]
    assert_equal "p3p0p9p6", path.extract_sets
  end

  def test_extract_sets
    path = Path.new
    csv = path.read_file('simple_paths.csv')
    assert_equal "p7p6p6p9", path.extract_sets

    path = Path.new
    csv = path.read_file('instructions.csv')
    assert_equal "p2p3p2p3", path.extract_sets

    path = Path.new
    csv = path.read_file('instructions.csv')
    assert_equal "p2p3p2", path.extract_sets(3)
    
    path = Path.new
    csv = path.read_file('instructions.csv')
    assert_equal "p2p3", path.extract_sets(2)

    path = Path.new
    csv = path.read_file('instructions.csv')
    assert_equal "p2", path.extract_sets(1) 
  end

  def test_increment_hash_value
    path = Path.new
    hash = {}
    path.increment_hash_value hash, "foo"
    assert_equal 1, hash["foo"]
    path.increment_hash_value hash, "foo"
    assert_equal 2, hash["foo"]
  end

  def test_remove_first_key
    path = Path.new
    hash = {}
    new_key = path.remove_first_key "two"
    assert_equal "o", new_key
  end

end