def genStrings
  charset = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z }
  return (0...3).map{ charset.to_a[rand(charset.size)] }.join    ## Select a random number and return it. Repeat this process 4 times. Join the results into a single string
end

def bSort(list)
  swapped = true

  while swapped == true
    swapped = false
    for pos in 0 ... (list.size - 1) ## for each item in list...
      for i in 0 ... list.size  ## itterate through the list to display it
        if ((i == pos) || (i == (pos + 1)))  ## if the item is one of the selected items, colour the text red
          $t = para list[i], :font => "Monospace 12px", :stroke => red, :displace_top => -25
        else ## colour the text black
          $t = para list[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25
        end
      end

      $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25 ## new line

      if (list.at(pos) > list.at(pos + 1)) ## If items need to be swapped with the one in front of it...
        swapped = true
        list[pos], list[pos+1] = list[pos+1], list[pos] ## Swap item.
      end
    end
  end

end

def bubble_sort(list)
  result = bSort(list) ## start the bubble sort

  $t = para "Bubble Sort Complete", :font => "Monospace 12px", :stroke => black, :displace_top => -25 ## Output the finished text
  $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25

  for i in 0 ... $uList.size
      $t = para $uList[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25 ## output the sorted list
  end

  return
end

## This is an inefficient implementation, but it is necessary to be able to properly display the lists
def qSort(list, start, stop, pivotPos) ## pivotPos represents the pivot position in the full list (not just the sub list)
  pivot = list.size - 1
  left = []
  right = []
  retList = []

  for pos in 0 ... list.size ## Divide items into sublists
    if list.at(pos) > list.at(pivot)
      right << list.at(pos)
    elsif list.at(pos) < list.at(pivot)
      left << list.at(pos)
    end
  end

  i = start
  for pos in 0 ... left.size  ## update master list
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

    for i in 0 ... $uList.size ## display list
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

  if left.size > 1  ## if left sublist is greater than 1, call sort function on sublist
    left = qSort(left, pivotPos - left.size, pivotPos - 1, pivotPos)
  end

  if right.size > 1 ## '' Right sublist ''
    right = qSort(right, pivotPos + 1, pivotPos + right.size, pivotPos)
  end

  ## combine full list
  if (left.size > 0)
    retList << left
  end

  retList << list.at(pivot)

  if (right.size > 0)
    retList << right
  end

  return retList.flatten(1) ## return flattened list
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
    for pos in 0 ... list.size ## for each item in list...
      holderPos = pos
      for pos2 in pos ... list.size ## itterate through list
        $t = para "\n", :font => "Monospace 12px", :stroke => black, :displace_top => -25
        for i in 0 ... list.size ## display current items being examined
          if ((i == pos) || (i == pos2))
            $t = para list[i], :font => "Monospace 12px", :stroke => red, :displace_top => -25
          else
            $t = para list[i], :font => "Monospace 12px", :stroke => black, :displace_top => -25
          end
        end
        if (list.at(pos2) < list.at(pos)) ## if selected item is less than current item, hold it's position
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

      list[pos], list[holderPos] = list[holderPos], list[pos] ## swap the held item and the current item (will be same if item is in correct spot)
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
