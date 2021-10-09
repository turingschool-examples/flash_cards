class CardGenerator
  attr_reader :cards
  def initialize(file)
    @cards = create_cards(file)
  end

  def create_cards(file)
    File.readlines(file).map do |line|
      parameters = line.split(',')
      Card.new(parameters[0], parameters[1], parameters[2].chop)
    end
  end
end
