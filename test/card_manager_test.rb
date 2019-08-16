require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/card_manager'

class CardManagerTest < Minitest::Test
  
  def setup
    @file_name = "./data/deck_1.txt"
    @card_manager = CardManager.new
  end

  def test_it_exists
    assert_instance_of CardManager, @card_manager
  end

  def test_validate_card_data 
    # make sure data is allowable to make a card
  end

  def test_create_card
    assert_instance_of Card, true
  end

  def test_load_cards_from_file
    # load cards from file
  end

  def test_save_cards_to_file
  end

end
