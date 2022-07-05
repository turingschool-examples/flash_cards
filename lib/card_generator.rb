require './card' #to call card class to set classes

 filename = "./cards.txt"
 class CardGenerator

   def initialize(filename)
     # file = File.open(filename)
     # array = File.read(filename).split(",")
     # cards = Card.new(array)

     IO.readlines(filename).each do |line|
       values = []
       values = line.split(",")   #.collect(&:strip)
       cards = Card.new(values[0],values[1],values[2])
     end
   end
 end
