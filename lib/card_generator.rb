class CardGenerator
  attr_reader :filename, :new_cards
  def initialize(filename)
    @filename = filename
    @new_cards = []
  end

  def cards
    file_data_by_line = File.read(@filename).split("\n")
    file_data_by_line.each do |line|
      split_line = line.split(",")
      @new_cards << Card.new(split_line[0], split_line[1], split_line[2].to_sym)
    end
    @new_cards
  end
end
