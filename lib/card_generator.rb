class CardGenerator
attr_reader :cards
  def initialize(filename)
    @filename = File.read(filename)
    @cards = []
    file_lines = @filename.lines
    split_file_lines = file_lines.map do |line|
      line.chomp.split(',')
    end
    split_file_lines.each do |line|
      card = Card.new(line[0], line[1], line[2])
      @cards << card
    end
  end
end
