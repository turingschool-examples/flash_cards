class CardGenerator
    attr_reader :file_path, :cards

    def initialize(file_path)
        @file_path = file_path
        @cards = []
    end

    def convert_to_cards
        File.foreach(@file_path) do |line|
            card = line.chomp.split(',')
            @cards << Card.new(card[0], card[1], card[2].to_sym)
          end
          @cards
    end
end