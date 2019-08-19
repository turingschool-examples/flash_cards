require './lib/card'
require './lib/card_reader'
require './lib/turn'
require './lib/deck'
require 'minitest/autorun'
require 'minitest/pride'

class CardReaderTest < Minitest::Test

  def setup
    @card_reader = CardReader.new
    @deck = Deck.new(@card_reader.read_cards("./test/cardtest.txt"))
  end

  def test_card_reader_exists

    assert_instance_of CardReader, @card_reader
  end

  def test_read_cards
    card = Card.new("Question1","Answer1","Category1")

    assert_equal card.question, @deck.cards[0].question
    assert_equal card.answer, @deck.cards[0].answer
    assert_equal card.category, @deck.cards[0].category
  end

end
