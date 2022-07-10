require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'

@card_1 = Card.new("Who is the most recent dwarf to hold the title elf friend?", "Gimli", :LOTR)
@card_2 = Card.new("Which son of Denethor II survives the trilogy?", "Faramir", :LOTR)
@card_3 = Card.new("Who encased themselves in carbonite intentionally in the clone wars?", "Anakin", :Star_wars)
@card_4 = Card.new("Who taught Yoda and Obi Wan to be force ghosts?", "Qui Gon Jin", :Star_wars)
@card_5 = Card.new("What drove the dwarves from Moria?", "Balrog", :LOTR)
@card_6 = Card.new("Who owned Anikin as boy?", "Watto", :Star_wars)
@card_7 = Card.new("Who was unafected by wearing the one ring after saving the hobbits from a willow tree?", "Tom Bombadil", :LOTR)
@cards = [@card_1, @card_2, @card_3, @card_4, @card_5, @card_6, @card_7]
@deck = Deck.new(@cards)
@round = Round.new(@deck)

def start

  puts "Welcome! You're playing with #{@round.deck.cards.count} cards."
  puts "--------------------------------------------------------------------------"
  loop_cards
end

def loop_cards
  # until (@round.turns.count + 1) == @round.deck.count do
  num_loops = @round.deck.cards.count
  num_loops.times do |index|
    current_card_in_loop = @round.turns.count + 1
    puts "This is card number #{current_card_in_loop} out of #{@round.deck.count}"
    puts "Question: #{@round.current_card.question}"
    input = gets.chomp
    # puts input
    @round.take_turn(input)
    puts @round.turns.last.feedback
  end
end



def give_feedback
  puts "****** Game Over! ******"
  puts "You had #{@round.correct_turns.count} correct guesses out of #{@round.turns.count} for a total score of #{@round.percent_correct}"

  puts "LOTR - #{@round.percent_correct_by_category(:LOTR)}% correct"
  puts "Star Wars - #{@round.percent_correct_by_category(:Star_wars)}% correct"
  # card_categories = []
#   @round.turns.each do |index|
#     # require "pry"; binding.pry
#     card_categories << @round.turns[index]
#   end
# # require "pry"; binding.pry
#   card_categories.uniq.each do |index|
#     current_percent = @round.percent_correct_by_category(card_categories(index).category).to_i
#     current_category = card_categories(index).category #.delete(:)
#     puts "#{current_category} - #{current_percent}% correct"
#   end
end


start

give_feedback
