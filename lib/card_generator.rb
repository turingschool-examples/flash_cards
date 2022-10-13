class CardGenerator
  def initialize(filename)
    @filename = filename
    @list_cards = []
  end

  def cards
    list_cards = File.foreach(@filename).map do |line|
      line.split(",").map.with_index do |item, idx|
        [item.chomp].group_by {|item| idx / 3}[0]
      end
    end
    list_cards.map {|set| Card.new(set[0][0], set[1][0], set[2][0])}
  end
end