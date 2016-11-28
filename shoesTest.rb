def genStrings
  charset = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z }
  return (0...3).map{ charset.to_a[rand(charset.size)] }.join
end

def qSort(list) 
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
  
  if left.size > 1
    left = qSort(left)
  end
    
  if right.size > 1
    right = qSort(right)
  end
  
  if (left.size > 0)
    retList << left
  end  
  
  retList << list.at(pivot)
  
  if (right.size > 0)
    retList << right
  end 
    
  $disp.text += "\n"
  $disp.text += list.at(pivot)
  $disp.text += "\n"
  
  return retList.flatten(1)
end

def quick_sort(list)
  result = qSort(list)
  
  $disp.text += "\n"
  
  result.each { |item| printList(item)}
  
  #printList "testing"
  
end

def printList(text)
  $disp.text += text
  
  $disp.text += " "
end

Shoes.app :width => 700, :height => 415 do
  background "../static/menu-gray.png"
  background "../static/menu-top.png", :height => 50
  background "../static/menu-left.png", :top => 50, :width => 55
  background "../static/menu-right.png", :right => 0, :top => 50, :width => 55
  image "../static/menu-corner1.png", :top => 0, :left => 0
  image "../static/menu-corner2.png", :right => 0, :top => 0

  $disp = edit_box width: 700, height: 385

  button "Quick Sort" do
    $disp.text = ""
    
    $uList = (0...6).map{ genStrings }
    $uList.each { |item| printList(item)}
    
    quick_sort($uList)
    
    
  end

end
