class Round
  attr_reader :deck, :turns
  def initialize(deck)
    @deck  = deck
    @turns = []
  end

  def current_card
    deck.cards[0]
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)
    # @turns.rotate!(1)
    @deck.cards.shift
    @turns.last

  end

  def number_correct
    correct_guesses = 0
    @turns.each do |turn|
      if turn.correct? == true
        correct_guesses += 1
      end
    end
    return correct_guesses
  end

  def number_correct_by_category(category)
    correct = 0
    @turns.each do |turn|
      if turn.card.category == category && turn.correct? == true
        correct += 1
      end
    end
    return correct
  end

  def percent_correct
    (number_correct.to_f / @turns.length) * 100

  end

  def turns_per_cat(category)
    @turns.count do |turn|
      turn.card.category == category
    end
  end

  def percent_correct_by_category(category)
    (number_correct_by_category(category).to_f / turns_per_cat(category)) * 100

  end

  def start

    puts "Welcome! You're playing with #{@deck.cards.length} cards.
-------------------------------------------------
This is card number 1 out of #{@deck.cards.length}.
Question: #{current_card.question}"
  answer = gets.chomp
   if answer == current_card.answer
     puts "Correct!"
   else
     puts "Incorrect."
   end
    # turn.feedback <<<<< figure out how to use this method

  end

end
