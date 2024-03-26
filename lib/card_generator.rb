class CardGenerator
    attr_reader :txt_file, :cards

    def initialize(txt_file)
        @txt_file = txt_file
        @cards = []
    end

    def convert_lines_to_cards
        File.foreach(@txt_file) do |line|
            card = line.chomp.split(',')
            @cards << Card.new(card[0], card[1], card[2].to_sym)
        end
        @cards
    end
end