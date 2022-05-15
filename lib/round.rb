class Round

  attr_reader :deck, :turns, :number_correct

  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0
  end

  def current_card
    deck.cards[0]
    #deck.cards.first
    #deck.cards.shift
    #deck.cards.rotate!(1)
  end

  def take_turn(new_guess)
    new_turn = Turn.new(new_guess, current_card)
    #require 'pry'; binding.pry
    @turns << new_turn
    if new_guess == current_card.answer
      @number_correct += 1
    end
    deck.cards.rotate!
    #might need to edit
    return new_turn
  end

  def number_correct_by_category(category)
    number_correct_by_category = 0

    @turns.each do |turn|
      if turn.card.category == category && turn.correct?
        number_correct_by_category += 1
      end
      return number_correct_by_category
    end
  end

 def percent_correct
    percent = (number_correct.to_f/turns.count) * 100
    return percent
  end

 def percent_correct_by_category(category)
   percent_correct_by_cat = 0.0

   @turns.each do |turn|
     if turn.card.category == category
       percent_correct_by_cat += 1.0
     end
    return (number_correct_by_category(category)/percent_correct_by_cat) * 100
  end
 end

 def start
   i = 0
   while i < deck.count
    i += 1
    puts "Question: #{current_card.question}"
    puts take_turn(gets.chomp).feedback
   end
  end

end
