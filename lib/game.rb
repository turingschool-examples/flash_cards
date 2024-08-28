class Game
  attr_reader :score, :card_file, :card_hash

  def initialize(card_file)
    @card_file = card_file
  end

  def load_cards
    # load cards into card_hash
    # each line should look like this:
    # card_name;[card_details]
    # Example: card_1;['What is 2 + 2?', '4', :STEM]

    card_hash = {}

    File.foreach(@card_file) do |line|
      card_name, card_details = line.chomp.split(';')
      card_hash[card_name] = card_details
    end
    puts card_hash
  end

  def hash_to_cards(card_hash)
    # given a hash of cards, this method will flatten
    # the key value pairs into an array of values
    # that can be used to create cards

    card_hash.each do |key, value|
      puts "The value of key #{key} is #{value}"
    end
  end

  def intro
  end

  def game_stats
  end

  def game_over
  end
end
