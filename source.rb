## The true assignment begins here

def genStrings
  charset = %w{ A B C D E F G H I J K L M N O P Q R S T U V W X Y Z }
  (0...6).map{ charset.to_a[rand(charset.size)] }.join
end

def createUnsortedFile
  fname = "unsorted.txt"
  uSortedFile = File.open(fname, "w")
  uSortedFile.puts (0...500).map{ genStrings }
  uSortedFile.close
end
