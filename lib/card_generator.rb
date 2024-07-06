# source https://www.writesoftwarewell.com/how-to-read-file-in-ruby/#:~:text=The%20simplest%20way%20to%20access,file%20%3D%20File.

File.foreach("./lib/card.txt") do |line| 
  puts line
  puts line.class
end


# puts content

# puts content.class