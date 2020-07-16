require 'csv'

class Path
  
  def read_file file_name
    @csv = CSV.read(file_name)
  end

  def extract_history_sets count=4
    
    sets_with_count = {}
    # sets_with_count["p1,p2,p3,p4"] = 1123

    @csv.each do |line|
      count = 1
      key = ""
      line.each do |history|
        key += history
        if count == 4
          sets_with_count[key].nil? ?  sets_with_count[key] = 1 : sets_with_count[key] += 1
          key = key[2..-1] # remove the first page to check the next set
        else 
          count += 1
        end 
      end
    end

    sets_with_count.max_by{|k,v| v}[0]

  end
end
