class CardGenerator
  attr_reader :data

  def initialize(filename)
    #refactor
    @data = File.readlines(filename, chomp: true).map{|line| line.gsub('"', '').split(',')}
  end

  def cards
    #refactor
    cards = @data.map{|card_data| Card.new(card_data[0], card_data[1], card_data[2].gsub(':', '').to_sym)}
  end
  
end
