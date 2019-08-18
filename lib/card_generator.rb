# implements class CardGenerator

class CardGenerator

     attr_reader    :cards, :count

     def initialize(filename)
       @filename    = filename
       @cards       = []
       @count       = 0

       f = File.open(@filename, "r")

       f.each_line do |line|
          temp = line.split(',')
          @cards << Card.new(temp[0], temp[1], temp[2])
       end

       f.close

       @cards
     end

     def count
       @count = `wc -l "#{@filename}"`.strip.split(' ')[0].to_i
     end

end


# require "./lib/card_generator"
# require "./lib/card"
# require "./lib/turn"
# require "./lib/deck"
# require "./lib/round"
#
# deck = Deck.new(CardGenerator.new("./lib/cards.txt").cards)
