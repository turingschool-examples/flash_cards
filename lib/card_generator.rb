class CardGenerator
  attr_reader :card_array

  def initialize(filename)
    @card_array1  = File.open(filename).map {|line| line.split("\n") }
    @card_array = @card_array1.flatten
    # I have an array of strings separated by commas
  end

    # I want each string in the array to be split on the commas
    def string_split_card
      @card_array.map {|card| card.split(",")}
    end

    # then each item is mapped to a Card class
    # question, answer, category
    def questions
      self.string_split_card.map {|string| string[0]}
    end

    # OR map the string_split_card array to a hash with question, answer, cards_in_category
    def card_hash
      card_hash_indv_keys = [:question, :answer, :category]
      @card_hash_array = self.string_split_card.map do |card_array|
        card_hash_indv_keys.zip(card_array).to_h
      end
      @card_hash_array
    end
end
