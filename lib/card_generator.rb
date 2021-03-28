open = File.open(ARGV[0],  "r")

cards_txt = open.read

open.close

puts cards_txt