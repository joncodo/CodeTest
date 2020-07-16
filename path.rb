require 'csv'

class Path
  
  def extract_sets set_length=4
    sets_with_count = {}

    line_count = 0
    @csv.each do |line|
      count = 1
      keys = []
      line_count += 1
      line.each do |history|
        keys.push history
        if keys.length == set_length
          increment_hash_value sets_with_count, flatten_array(keys)
          keys.shift
        end 
      end
    end

    p sets_with_count.max_by{|k,v| v}
    sets_with_count.max_by{|k,v| v}[0]
  end

  def read_file file_name
    @csv = CSV.read(file_name)
  end

  def increment_hash_value hash, key
    hash[key].nil? ? hash[key] = 1 : hash[key] += 1
  end

  def flatten_array arr
    arr.map { |s| "#{s}" }.join('')
  end

end
