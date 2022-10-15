class CardGenerator
    attr_reader :text
  def initialize(filename)
    # require 'pry'; binding.pry
    @text = File.read(filename)
 

  end

  def cards
    deck = []
    text.each_line do |card| 
        deck << Card.new(card.chomp.split(',')[0],card.chomp.split(',')[1],card.chomp.split(',')[2])
        # require 'pry'; binding.pry
    end



    # Card.new(text.split(',')[0],text.split(',')[1],text.split(',')[2])
    # require 'pry'; binding.pry
    Deck.new(deck)
  end
end
