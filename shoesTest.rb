def genStrings
  charset = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z }
  return (0...3).map{ charset.to_a[rand(charset.size)] }.join
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
  
  
  #$disp += "\n"
  #$uList.each { |item| printList(item)}

    #for i in 0 ... $uList.size
    #  if (i == pivotPos)
    #    $t = para $uList[i], :font => "Monospace 12px", :stroke => red
    #  elsif (i >= (pivotPos - left.size) & i < pivotPos)
    #    $t = para $uList[i], :font => "Monospace 12px", :stroke => green
    #  else
    #    $t = para $uList[i], :font => "Monospace 12px", :stroke => black
    #  end
    #end
    
    for i in 0 ... $uList.size
      if (i == pivotPos)
        $t = para $uList[i], :font => "Monospace 12px", :stroke => red
      elsif ((i >= (pivotPos - left.size)) & (i < pivotPos))
        $t = para $uList[i], :font => "Monospace 12px", :stroke => green
      elsif ((i > pivotPos) & (i <= pivotPos + right.size))
        $t = para $uList[i], :font => "Monospace 12px", :stroke => blue
      else
        $t = para $uList[i], :font => "Monospace 12px", :stroke => black
      end
    end
    
  
  $t = para "\n", :font => "Monospace 12px", :stroke => black
  
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
  
  $t = para "Quick Sort Complete", :font => "Monospace 12px", :stroke => black
  $t = para "\n", :font => "Monospace 12px", :stroke => black

  #$disp += "\n"
  
  for i in 0 ... $uList.size
      $t = para $uList[i], :font => "Monospace 12px", :stroke => black
  end
  
  $t = para $disp, :font => "Monospace 12px", :stroke => black
  #$t.replace $disp
end

def printList(text)
  $disp += text
  
  $disp += " "
end

Shoes.app :width => 700, :height => 415 do
  background "../static/menu-gray.png"
  background "../static/menu-top.png", :height => 50
  background "../static/menu-left.png", :top => 50, :width => 55
  background "../static/menu-right.png", :right => 0, :top => 50, :width => 55
  image "../static/menu-corner1.png", :top => 0, :left => 0
  image "../static/menu-corner2.png", :right => 0, :top => 0

  ##$disp = edit_box width: 700, height: 385

  $t = para "", :font => "Monospace 12px", :stroke => black

  #button "Quick Sort" do
    $disp = ""
    
    $uList = (0...6).map{ genStrings }
    
    for i in 0 ... $uList.size
      if (i == $uList.size - 1)
        $t = para $uList[i], :font => "Monospace 12px", underline: "single"
      else
        $t = para $uList[i], :font => "Monospace 12px", :stroke => black
      end    
    end
    
    $t = para "\n", :font => "Monospace 12px", :stroke => black
      
    lst = $uList
    
    quick_sort(lst, 0, (lst.size-1), (lst.size-1))
    
    
  #end

end
