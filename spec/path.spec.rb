require "minitest/autorun"
require "./path"

class PathTest < Minitest::Test
  def test_read_file
    path = Path.new
    assert_equal path.read_file("paths.csv")[0], ["p9", "p3", "p6"]
    assert_equal "p3p0p9p6", path.extract_sets
    assert_equal "p9p3p0p9p6", path.extract_sets(5)
    assert_equal "p10p10p1p3p6p8p2", path.extract_sets(7)
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

  def test_flatten_array
    path = Path.new
    hash = {}
    new_key = path.flatten_array ['p1', 'p2']
    assert_equal "p1p2", new_key
    new_key = path.flatten_array ['p10', 'p2']
    assert_equal "p10p2", new_key
    new_key = path.flatten_array ['p198737', 'p2']
    assert_equal "p198737p2", new_key
  end

end