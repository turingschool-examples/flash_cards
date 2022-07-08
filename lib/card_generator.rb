class CardGenerator
    attr_reader :text_file, :file_contents
    def initialize(text_file)
        @text_file = text_file
        @file_contents = file_contents
    end

    def split_text
        data_lines_array = @file_contents.split("\n")
        data_lines_array.map! do |line|
            line.split(",")
        end
        return data_lines_array
    end

    def open_file
        @file_contents = File.read("./lib/"+@text_file)
    end

    def create_card(new_card, card_number, data_lines_array)
        new_card = Card.new(data_lines_array[card_number][0].strip,data_lines_array[card_number][1].strip,data_lines_array[card_number][2].strip)
    end

    def cards
        open_file
        data_lines_array = split_text
        card_number = 0
        new_card = "card_" + card_number.to_s
        cards = []
        until card_number == data_lines_array.count
            cards << create_card(new_card, card_number, data_lines_array)
            card_number += 1
        end
        return cards
    end
end