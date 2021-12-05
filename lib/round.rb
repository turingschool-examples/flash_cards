
class Round
  attr_reader :deck, :turns

  def initialize(deck)
    @deck = deck
    @turns = [ ]
  end

  def current_card
    deck.cards.first#returns first index in the Deck cards array.
  end

  def take_turn(guess)
    @turns << Turn.new(guess, current_card)#create new Turn object instance of new_turn with 2 arguments. shovel into empty @turns array.
    deck.cards.rotate!(1)#rotate's array element's index (ex. [card_1, card_2, card_3] #rotate(1) = [card_2, card_3, card_1])
    turns.last#return of last element of the array.
  end

  def number_correct
    turns.count do |turn|#counts the number of elements that the block returns a true value.
      turn.correct?#return number of correct?/true elements from |turn|.
    end
  end

  def number_correct_by_category(category)
    turns.count do |turn|#counts the number of elements that the block returns a true value.
      turn.correct? && category == turn.card.category#return number of correct?/true elements from |turn|. the category argument is equal to the current turns category.
    end
  end

    def percent_correct
      (number_correct / turns.count.to_f ) * 100#the number of correct guesses devided by the total amount of turns taken. turn into float and multiply by 100 to get percent.
    end

    def percent_correct_by_category(category)
      #the total number of correct guesses from each category devided by the total amount of turns taken for each individual category converted to a float and multiply by 100 to get percent.
      (number_correct_by_category(category) / turns.count {|turn| turn.card.category == category}.to_f ) * 100
    end
  end
