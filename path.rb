require 'csv'

class Path
  
  def extract_sets set_length=4
    sets_with_count = {}

    @csv.each do |line|
      count = 1
      key = ""
      line.each do |history|
        key += history
        if count == set_length
          increment_hash_value sets_with_count, key
          key = remove_first_key key
        else 
          count += 1
        end 
      end
    end

    sets_with_count.max_by{|k,v| v}[0]
  end

  def read_file file_name
    @csv = CSV.read(file_name)
  end

  def increment_hash_value hash, key
    hash[key].nil? ? hash[key] = 1 : hash[key] += 1
  end

  def remove_first_key key
    key[2..-1]
  end

end
