require './lib/card_generator'
require 'minitest/autorun'
require 'pry'
class CardGeneratorTest < Minitest::Test
    
    def test_it_exists
        cards = CardGenerator.new("cards.txt")
        assert_instance_of CardGenerator , cards
    end

    def test_it_can_load_a_file
        filename = File.read("cards.txt").split("\n")
        
        assert_equal filename = "cards.txt" , filename
    end

    def test_it_can_parse_data
        skip

        #file_data = ["What is 5 + 5?,10,STEM" ,"What is Rachel's favorite animal?,red panda,Turing Staff" ,"What is Mike's middle name?,nobody knows,Turing Staff" , "What cardboard cutout lives at Turing?,Justin bieber,PopCulture"]
        filename = File.read("cards.txt").split("\n")

        assert_equal file_data , filename
    end

    def test_it_can_turn_data_into_objects
        skip
        card_1 = Card.new("What is 5 + 5?", "10", :STEM)
        card_2 = Card.new("What is Rachel's favorite animal?" , "red panda" , :Turing_Staff)
        card_3 = Card.new("What is Mike's middle name?" , "nobody knows" , :Turing_Staff)
        card_4 = Card.new ("What cardboard cutout lives at Turing?" , "Justin bieber" , :PopCulture)
        card_data = [@card_1, @card_2, @card_3, @card_4]



        assert_equal card_data , cards

    end

end