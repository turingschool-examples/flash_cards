# implements class CardGenerator

class CardGenerator

     attr_reader    :cards, :count

     def initialize(filename)
       @filename    = filename
       @cards       = []
       @count       = 0

       f = File.open(@filename, "r")

       f.each_line do |line|

         @cards << line.split(",")
       end

       f.close
     end

     def count
       @count = `wc -l "#{@filename}"`.strip.split(' ')[0].to_i
     end

end
