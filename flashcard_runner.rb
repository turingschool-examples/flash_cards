require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("Who is the most recent dwarf to hold the title elf friend?", "Gimli", :LOTR)
@card_2 = Card.new("Which son of Denethor II survives the trilogy?", "Faramir", :LOTR)
@card_3 = Card.new("Who encased themselves in carbonite intentionally in the clone wars?", "Anikin", :Star_wars)
@card_4 = Card.new("Who taught Yoda and Obi Wan to be force ghosts?", "Qui Gon Jin", :Star_wars)
@card_5 = Card.new("What drove the dwarves from Moria?", "Balrog", :LOTR)
@card_6 = Card.new("Who owned Anikin as boy?", "Watto", :Star_wars)
@card_7 = Card.new("Who was unafected by wearing the one ring after saving the hobbits from a willow tree?", "Tom Bombadil", :LOTR)
@deck = Deck.new([@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7])
@round = Round.new(@deck)

def start

  puts "Welcome! You're playing with #{@round.deck.cards.count} cards."
  puts "--------------------------------------------------------------------------"
  loop_cards
end

def loop_cards
  # until (@round.turns.count + 1) == @round.deck.count do
  num_loops = @round.deck.cards.count
  num_loops.times do
    current_card_in_loop = @round.turns.count + 1
    puts "This is card number #{current_card_in_loop} out of #{@round.deck.count}"
    puts "Question: #{@round.current_card.question}"
    input = gets.chomp
    # puts input
    @round.take_turn(input)
    puts @round.turns.last.correct?
  end
end

# def analize
#   card_categories = []
#   @round.turns.each do |turn|
#     card_categories << @round.turns.card.category #.delete(:)
#   end
# end



# require "pry"; binding.pry
start

give_feedback
