class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
  end

  def start
puts "Welcome! You're playing Eagle's Knowledge Assessment!"

puts "                        _--_"
puts "                       /   -)"
puts "                   ___/___|___"
puts "      ____-----=~~///|     ||||~~~==-----______"
puts "    //~////////////~/|     |/~/|||||\\\\\\\\\\\\\\\\\\~\\\\"
puts "  ////////////////////|   |///////|\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\"
puts " /////~~~~~~~~~~~~~~~\ |.||/~~~~~~~~~~~~~~~~\\\\\\\\\\\\\\\\"
puts "//~                  /\\|\\\\\                       ~\\\\"
puts "                    ///W^\W\\"
puts "                   ////|||\\\\"
puts "                   ~~~~~~~~~~~"
puts "This assessment will test your knowledge with #{@deck.count} questions."
puts "                  GOOD LUCK!!!"
puts "

"

end


  def current_card
    @deck.cards[@turns.count]
  end

  def take_turn(guess)
  new_turn = Turn.new(guess, current_card)
  @turns << new_turn
  new_turn
  end

  def number_correct
    @turns.count do |turn|
    turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      turn.correct? if turn.card.category == category
    end
  end

  def percent_correct
    (number_correct / turns.count.to_f) * 100
  end

  def percent_correct_by_category(category)
    num_cards_in_category = 0

    @turns.each do |turn|
      num_cards_in_category += 1 if turn.card.category == category
    end
    (number_correct_by_category(category) / num_cards_in_category.to_f) * 100
  end

end
