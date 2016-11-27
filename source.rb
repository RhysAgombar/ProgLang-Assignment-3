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
    ret = sSort(split(list[0..mid-1]).concat(split(list[mid..-1])))
    return ret
  else
    if (list.size == 1)
      return list
    else 
      return sSort(list)
    end
  end
end

def merge_sort(list)
  result = split(list)
  puts "Merge Sort Complete"
  
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
  result = sSort(list)  
  puts "Selection Sort Complete" 
  
  fname = "selectionSorted.txt"
  sortedFile = File.open(fname, "w")
  sortedFile.puts result
  sortedFile.close
end

def qSort(list) 
  #puts list
  pivot = list.size - 1
  left = []
  right = []

  for pos in 0 ... list.size
    if list.at(pos) > list.at(pivot)
      right << list.at(pos)
    elsif list.at(pos) < list.at(pivot)
      left << list.at(pos)
    end
  end
  
  if left.size > 1
    left = qSort(left)
  end
    
  if right.size > 1
    right = qSort(right)
  end
    
  return left << list.at(pivot) << right
end

def quick_sort(list)
  result = qSort(list)
  puts "Quick Sort Complete"

  fname = "quickSorted.txt"
  sortedFile = File.open(fname, "w")
  sortedFile.puts result
  sortedFile.close
end

def bSort(list)
  
end

def bubble_sort(list)
  
end

createUnsortedFile(200)
lines = loadArray("unsorted.txt")
selection_sort(lines)
merge_sort(lines)
quick_sort(lines)
