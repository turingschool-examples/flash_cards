require './lib/card'
require './lib/turn'
require './lib/deck'
require './lib/round'
require './runner/flashcard_runner'

class CardGenerator
  def initialize(flash_cards)
    @flash_cards = flash_cards
  end

  def generate_cards

    cards = []
    flash_cards.foreach(@filename) do |line|
      question, answer, category = line.chomp.split(',')
      cards << Flashcard.new(question, answer, category)
    end

    cards
  end
end
