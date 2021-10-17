class Round
  attr_reader :deck,
              :turns
  def initialize(deck)
    @deck  = deck
    @turns = []
    @count = 1
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    @count += 1
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    @deck.cards.rotate!
    new_turn
  end

  def number_correct
    @turns.count do |turn|
      turn.correct?
    end
  end

  def number_correct_by_category(category)
    @turns.count do |turn|
      if turn.correct?
        category == turn.card.category
      end
    end
  end

  def percent_correct
    (number_correct.to_f / @turns.length.to_f) * 100
  end

  def percent_correct_by_category(category)
  # require "pry"; binding.pry
    (number_correct_by_category(category).to_f / number_correct.to_f) * 100
  end

  def start
    puts "Welcome! You're playing with 4 cards."
    puts "-------------------------------------------------"
    puts "This is card number #{@count} out of 4."
    puts "Question: #{current_card.question}"
  end
# require "pry"; binding.pry
  def play_round

    until @turns.length == @deck.cards.length
      guess = gets.chomp
      take_turn(guess)
      puts @turns.last.feedback
      puts "This is card #{@count} out of 4."
      puts "Question: #{current_card.question}"
    end
# require "pry"; binding.pry
      puts "****** Game over! ******"
      puts "You had #{number_correct} out of #{turns.count} for a score of #{percent_correct.to_i.to_s.insert(-1, "%")}"

      #attempted to do each, map, select and other enumerables to access turns and getting
      #unidentified method number_correct_by_category
      # @round.turns.map do |card|
      #   puts card.category
      # end
      #need dynamic way to access each card category and interpolate,
      #into a string with % appended (i.e. STEM - 100% correct)
      #Also need to be able to access total number of questions asked per category in order to
      #compare that to the total number answered correctly
      puts "STEM - #{percent_correct_by_category(:STEM).to_i.to_s.insert(-1, '%')}"
      puts "Turing Staff - #{percent_correct_by_category("Turing Staff").to_i.to_s.insert(-1, '%')}"
      puts "Pop Culture - #{percent_correct_by_category("Pop Culture").to_i.to_s.insert(-1, '%')}"
  end
end






