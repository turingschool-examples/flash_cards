# round.rb
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = []
    @current_card_index = 0
  end

  def current_card
    deck.cards[@current_card_index]
  end

  def take_turn(guess)
    turn = Turn.new(current_card, guess)
    @turns << turn
    @current_card_index += 1
    turn
  end
  
    def number_correct
      correct_count = 0
      turns.each do |turn|
        if turn.correct?
          correct_count +=1
        end
      end
      correct_count
    end

    def number_correct_by_category(category)
      correct_count = 0
      turns.each do |turn|
        if turn.correct? && turn.card.category == category
          correct_count += 1
        end
      end
      correct_count
    end
    
    def percent_correct
      (number_correct.to_f / turns.length) * 100
    end
    
    def percent_correct_by_category(category)

    category_turns = []
    turns.each do |turn|
      if turn.card.category == category
      category_turns << turn
      elsif category_turns.empty?
        return 0
      else
        correct_count = number_correct_by_category(category)
        percentage = (correct_count.to_f / category_turns.length) * 100
        return percentage
      end
  end
  
    def move_to_next_card
      @current_card_index += 1
      @current_card = @deck.cards[@current_card_index]
    end
  end
end