## The true assignment begins here

def genStrings
  charset = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z }
  (0...6).map{ charset.to_a[rand(charset.size)] }.join
end

def createUnsortedFile(num)
  fname = "unsorted.txt"
  uSortedFile = File.open(fname, "w")
  uSortedFile.puts (0...num).map{ genStrings }
  uSortedFile.close
end

def loadArray(fname)
  lines = File.readlines(fname)
  return lines
end

def split(list)
  mid = list.size/2
  if (list.size > 2)
    ret = split(list[0..mid-1]).concat(split(list[mid..-1])).sort
    return ret
  else
    if (list.size == 1)
      return list
    else 
      return list.sort
    end
  end
end

def merge_sort(list)
  start = Time.now
  result = split(list)
  stop = Time.now
  delta = (stop - start)
  
  puts "Merge Sort took: " << delta.to_s << " seconds - List size: " << result.size().to_s

  fname = "mergeSorted.txt"
  sortedFile = File.open(fname, "w")
  sortedFile.puts result
  sortedFile.close
end

def sSort(list)
  holderPos = 0
  
    for pos in 0 ... list.size
      holderPos = pos
      for pos2 in pos ... list.size

        if (list.at(pos2) < list.at(pos))
          
          if (list.at(pos2) < list.at(holderPos))
            holderPos = pos2
          end
          
        end

      end  
      
      list[pos], list[holderPos] = list[holderPos], list[pos]
          
    end
    
    return list
    
end

def selection_sort(list)
  start = Time.now
  result = sSort(list)
  stop = Time.now
  delta = (stop - start)
  
  puts "Selection Sort took: " << delta.to_s << " seconds - List size: " << result.size().to_s

  fname = "selectionSorted.txt"
  sortedFile = File.open(fname, "w")
  sortedFile.puts result
  sortedFile.close
end

createUnsortedFile(10000)
lines = loadArray("unsorted.txt")
selection_sort(lines)
merge_sort(lines)

