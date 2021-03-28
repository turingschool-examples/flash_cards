class CardGenerator
  attr_reader :filename, :cards
  def initialize(filename)
    @filename = filename
    # @cards = []
    # @cards = create_array_of_card_data(filename).map do |card_data|
    #   create_card(card_data)
    # end
  end

  def load_file(filename)
    File.read(filename)
  end

  def create_array_of_card_data(filename)
    load_file(filename).split("\n")
  end

  def cards
    create_array_of_card_data(@filename).map do |card_data|
      create_card(card_data)
    end
  end

  def create_card(card_information)
    individual_card_data = card_information.split(",")
    if individual_card_data.length == 3
      card = Card.new(individual_card_data[0], individual_card_data[1], individual_card_data[2])
    end
    card
  end
end
