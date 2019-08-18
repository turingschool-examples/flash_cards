require 'minitest/autorun'
require 'minitest/pride'
require './lib/card_generator'
require './lib/card'

class CardGeneratorTest < Minitest::Test

  def setup
    filename = "../flash_cards/cards.txt"
    @cards = CardGenerator.new(filename)
  end

  def test_it_exists
    assert_instance_of CardGenerator, @cards
  end

  def test_file_opens
    assert @cards.card_array
  end

  def test_cards_generated_is_array_of_4
    assert_equal 4, @cards.card_array.length
  end

  def test_first_string_in_array
    assert_equal "What is 5 + 5?,10,STEM", @cards.card_array[0]
  end

  def test_map_first_string_to_array
    assert_equal ["What is 5 + 5?","10","STEM"], @cards.string_split_card[0]
  end

  def test_find_card_question
    assert_equal "What is 5 + 5?", @cards.questions[0]
  end

  def test_card_hash_keys
    assert_equal [:question, :answer, :category], @cards.card_hash[0].keys
    assert_instance_of Hash, @cards.card_hash[0]
  end

  # each array of strings needs to be mapped to the hash_keys
  # for each array, value[0] = question, value[1] answer, and value[2], cards_in_category
  def test_assign_question_to_hash
    #found an index
    assert_equal "What is Mike's middle name?", @cards.string_split_card[2][0]
    assert_equal "nobody knows", @cards.card_hash[2][:answer]
  end

  def test_card_dict_becomes_card_class
    new_card = Card.new(@cards.card_hash[0][:question],[:answer],[:category])
    assert_instance_of Card, new_card
  end

  def test_cards
    cards_are_cards = @cards.cards
    assert_instance_of Array, cards_are_cards
    assert_instance_of Card, cards_are_cards[0]
    assert_instance_of Card, cards_are_cards[1]
  end

end
