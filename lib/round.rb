require './lib/card'
require './lib/turn'
require './lib/deck'

class Round

  attr_reader :deck, :turns
  attr_accessor :correct_answers, :turn_count, :total_cards, :categories

  def initialize(deck, turns = [], correct_answers = 0, turn_count = 1, total_cards = 0, categories = [])
    @deck = deck
    @turns = turns
    @correct_answers = correct_answers
    @turn_count = turn_count
    @total_cards = total_cards
    @categories = categories
  end

  def current_card
    self.deck.cards.first
  end

  def take_turn(answer, card = self.current_card)
    self.deck.cards.shift
    @turn_count += 1
    new_turn = Turn.new(answer, card)
    self.turns << new_turn
    # refactor this using the .correct? method from Turn class
    if self.turns.last.guess == self.turns.last.card.answer
      @correct_answers += 1
    end
    new_turn
  end

  def number_correct
    @correct_answers
  end

# The percent correct method will take in correct_answers, convert it to a float, and divide it by the number of turns taken so far
  def percent_correct
    (@correct_answers.to_f / self.turns.count) * 100
  end
  
  
  # the number correct by category method needs to take a category as an argument. it should make an array of cards that include that category. it should then test that array for correct answers (answer == guess) and return the total number of correct answers.
  def number_correct_by_category(cat)
    num_by_cat = 0
    self.turns.each do |turn|
      if turn.correct? && turn.card.category == cat
        num_by_cat =+ 1
      end
    end
    num_by_cat
  end
  
  # The percent correct by category method will be passed a card category as an argument. It will then divide the value of the number_correct_by_category method converted to float by the total occurences of that category in the deck
  
    def percent_correct_by_category(cat)
      total_by_cat = 0
      self.turns.each do |turn|
        if turn.card.category == cat
          total_by_cat += 1
        end
      end
      (self.number_correct_by_category(cat).to_f / total_by_cat) * 100
    end

    # Add a method to start the game
    def start
      @total_cards = self.deck.cards.count
      puts "\n\n"
      puts "Welcome! You're playing with #{@total_cards} cards."
      puts "-"*30
    end

    # Add a collect category method to handle end game feedback
    def collect_category
      self.turns.each do |turn|
        if self.categories.include?(turn.card.category) == false
          @categories << turn.card.category
        end
      end
    end
  end
