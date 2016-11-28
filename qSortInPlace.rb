def genStrings
  charset = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z }
  (0...3).map{ charset.to_a[rand(charset.size)] }.join
end

def printList(text)
  print text
  print " "
end

def qSort(list, start, stop, pivotPos) 
  #puts list
  pivot = list.size - 1
  left = []
  right = []
  retList = []

  for pos in 0 ... list.size
    if list.at(pos) > list.at(pivot)
      right << list.at(pos)
    elsif list.at(pos) < list.at(pivot)
      left << list.at(pos)
    end
  end
  
  i = start
  for pos in 0 ... left.size
    $uList[i] =  left.at(pos)
    i += 1
  end
  
  $uList[i] =  list.at(pivot)
  pivotPos = i
  i += 1
  
  for pos in 0 ... right.size
    $uList[i] =  right.at(pos)
    i += 1
  end
  
  
  puts ""
  $uList.each { |item| printList(item)}
  #puts pivotPos
  #puts pivotPos - left.size
  #puts pivotPos - 1
  
  #puts pivotPos + 1
  #puts pivotPos + right.size
  
  #for i in 0 ... $uList.size
  #  if (i == pivotPos)
  #    print "red " #$t = para $uList[i], :font => "Monospace 12px", :stroke => red
  #  elsif ((i >= (pivotPos - left.size)) & (i < pivotPos))
  #    print "green "
      #$t = para $uList[i], :font => "Monospace 12px", :stroke => green
  #  elsif ((i > pivotPos) & (i <= pivotPos + right.size))
  #    print "blue "
      #$t = para $uList[i], :font => "Monospace 12px", :stroke => blue
  #  else
  #    print "black "
      #$t = para $uList[i], :font => "Monospace 12px", :stroke => black
  #  end
  #end
  
  
  st =  $uList.size - ($uList.size - list.size) - 1
    
  if left.size > 1
    left = qSort(left, pivotPos - left.size, pivotPos - 1, pivotPos)
  end
    
  if right.size > 1
    right = qSort(right, pivotPos + 1, pivotPos + right.size, pivotPos)
  end
  
  if (left.size > 0)
    retList << left
  end  
  
  retList << list.at(pivot)
  
  if (right.size > 0)
    retList << right
  end 
    
  return retList.flatten(1)
end

def quick_sort(list, start, stop, pivotPos)
  result = qSort(list, start, stop, pivotPos)
  puts "\nQuick Sort Complete"

  $uList.each { |item| printList(item)}
end

$uList = (0...6).map{ genStrings }

$uList.each { |item| printList(item)}

lst = $uList

quick_sort(lst, 0, (lst.size-1), (lst.size-1))


