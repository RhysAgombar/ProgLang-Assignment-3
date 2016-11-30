def genStrings
  charset = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z }
  return (0...3).map{ charset.to_a[rand(charset.size)] }.join
end

## :displace_top => -25 for every line

def bSort(list)
  swapped = true
  
  while swapped == true
    swapped = false
    for pos in 0 ... (list.size - 1)
      for i in 0 ... list.size
        if ((i == pos) || (i == (pos + 1)))
          $t = para list[i], :font => "Monospace 12px", :stroke => red, :displace_top => -25 
        else
          $t = para list[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25 
        end    
      end
      
      $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 
      
      if (list.at(pos) > list.at(pos + 1))
        swapped = true        
        list[pos], list[pos+1] = list[pos+1], list[pos]
      end
    end
  end 
  
end

def bubble_sort(list)
  result = bSort(list)
  
  $t = para "Bubble Sort Complete", :font => "Monospace 12px", :stroke => black, :displace_top => -25 
  $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 

  for i in 0 ... $uList.size
      $t = para $uList[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25 
  end
  
  return
end


def qSort(list, start, stop, pivotPos) 
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
    
    for i in 0 ... $uList.size
      if (i == pivotPos)
        $t = para $uList[i], :font => "Monospace 12px", :stroke => red, :displace_top => -25 
      elsif ((i >= (pivotPos - left.size)) & (i < pivotPos))
        if ((left.size > 1) & (i == pivotPos - 1))
          $t = para $uList[i], :font => "Monospace 12px", :stroke => green, underline: "single", :displace_top => -25 
        else
          $t = para $uList[i], :font => "Monospace 12px", :stroke => green, :displace_top => -25 
        end
      elsif ((i > pivotPos) & (i <= pivotPos + right.size))
        if ((right.size > 1) & (i == pivotPos + right.size))
          $t = para $uList[i], :font => "Monospace 12px", :stroke => blue, underline: "single", :displace_top => -25 
        else
          $t = para $uList[i], :font => "Monospace 12px", :stroke => blue, :displace_top => -25 
        end
      else
        $t = para $uList[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25 
      end
    end
    
  
  $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 
  
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
  
  $t = para "Quick Sort Complete", :font => "Monospace 12px", :stroke => black, :displace_top => -25 
  $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 

  for i in 0 ... $uList.size
      $t = para $uList[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25 
  end
  
  return

end

def sSort(list)
  holderPos = 0
    for pos in 0 ... list.size
      holderPos = pos
      for pos2 in pos ... list.size
        $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 
        for i in 0 ... list.size          
          if ((i == pos) || (i == pos2))
            $t = para list[i], :font => "Monospace 12px", :stroke => red, :displace_top => -25 
          else
            $t = para list[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25 
          end    
        end
        if (list.at(pos2) < list.at(pos))          
          if (list.at(pos2) < list.at(holderPos))
            holderPos = pos2
          end
        end
      end        
      
      $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 
      
      for i in 0 ... list.size
        if ((i == pos) || (i == holderPos))
          $t = para list[i], :font => "Monospace 12px", :stroke => darkorange, :displace_top => -25 
        else
          $t = para list[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25 
        end    
      end
      
      list[pos], list[holderPos] = list[holderPos], list[pos]          
    end
        
    return list    
end

def selection_sort(list)
  result = sSort(list)  
  
  $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 
  $t = para "Selection Sort Complete", :font => "Monospace 12px", :stroke => black, :displace_left => 0, :displace_top => -25 
  $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 

  for i in 0 ... $uList.size
      $t = para $uList[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25 
  end
  
end

def bButtonClick  
  clear()
  
  genButtons
  
  $uList = (0...4).map{ genStrings }
    
  for i in 0 ... $uList.size
      $t = para $uList[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25    
  end
  
  $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 
        
  lst = $uList
      
  bubble_sort(lst)
  
  return 
end


def sButtonClick  
  clear()
  
  genButtons
  
  #$t = para "\n", :font => "Monospace 1px", underline: "single"
  
  $uList = (0...4).map{ genStrings }
    
  for i in 0 ... $uList.size
      $t = para $uList[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25     
  end
  
  #$t = para "\n", :font => "Monospace 12px", :stroke => black
        
  lst = $uList
      
  selection_sort(lst)
  
  return 
end

def qButtonClick  
  clear()
  
  genButtons
  
  #$t = para "\n", :font => "Monospace 1px", underline: "single"
  
  $uList = (0...14).map{ genStrings }
    
  for i in 0 ... $uList.size
    if (i == $uList.size - 1)
      $t = para $uList[i], :font => "Monospace 12px", underline: "single", :displace_top => -25 
    else
      $t = para $uList[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25 
    end    
  end
  
  $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 
        
  lst = $uList
      
  quick_sort(lst, 0, (lst.size-1), (lst.size-1))
  
  return 
end

def genButtons
  button "Quick Sort", :displace_top => 340 do
    qButtonClick
  end
  
  button "Selection Sort", :displace_top => 340, :displace_left => 0 do
    sButtonClick
  end
  
  button "Bubble Sort", :displace_top => 340, :displace_left => 0 do
    bButtonClick
  end
end

Shoes.app :width => 376, :height => 370 do
  background "../static/menu-gray.png"
  background "../static/menu-top.png", :height => 50
  background "../static/menu-left.png", :top => 50, :width => 55
  background "../static/menu-right.png", :right => 0, :top => 50, :width => 55
  image "../static/menu-corner1.png", :top => 0, :left => 0
  image "../static/menu-corner2.png", :right => 0, :top => 0
    
  qButtonClick()
  
end
