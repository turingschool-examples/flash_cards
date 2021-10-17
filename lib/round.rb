class Round
  attr_reader :deck,
              :turns,
              :number_correct

  def initialize(deck)
    @deck           = deck
    @turns          = []
    @correct_turns  = []
  end

  def current_card
    @deck.cards.first
  end

  def take_turn(guess)
    new_turn = Turn.new(guess, current_card)
    @turns << new_turn
    if guess == current_card.answer
      @correct_turns << new_turn
    end
    @deck.cards.rotate!
    return new_turn
  end

  def number_correct
    @correct_turns.length
  end

  def number_correct_by_category(category)
    num = @correct_turns.select do |turn|
              category == turn.card.category
          end
    num.length
  end

  def percent_correct
    ((@correct_turns.length.to_f / @turns.length.to_f) * 100).ceil(2)
  end

  def percent_correct_by_category(category)
    (((number_correct_by_category(category)).to_f / @deck.cards_in_category(category).length.to_f) * 100).ceil(2)
  end

  def start
    puts "Welcome! You're playing with #{deck.count} cards!"

    until @turns.length == deck.count do
      puts " -*- " * 6
      puts "This is card number #{(turns.length.to_i) + 1} of #{@deck.count}"
      puts "#{current_card.question}"
      guess = gets.chomp
      puts (take_turn(guess)).feedback
    end

    puts """
    *-*-*-* GAME OVER *-*-*-*
    You had #{number_correct} guesses out of 6 for a total score of #{percent_correct}%.
    Boolean Logic -- #{percent_correct_by_category(:Boolean_Logic)}% correct
    Syntactic Fun -- #{percent_correct_by_category(:Syntactic_Fun)}% correct
    Dumb Shit I've Done -- #{percent_correct_by_category(:Dumb_Shit_Ive_Done)}% correct
    """
  end
end
