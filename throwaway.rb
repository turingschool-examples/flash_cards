require 'pry'
#
# og = "Question1,Answer1,cat1\nQuestion2,Answer2,cat1\nQuestion3,Answer3,cat2\n"
# og.chomp!
#
# ogg = og.gsub("\n", ",")
#
# og_arr = ogg.split(',')
#
# og_threes = og_arr.each_slice(3).to_a
#
# # real = ["Question1", "Answer1", :cat1, "Question2", "Answer2", :cat1, "Question3", "Answer3", :cat2]
# #
# # # This could be useful to parse out the :cats, but not for making cards.
# # really_want = real.each_slice(3).to_a
# # # real_arr = real.split(',' , '\n')
#
# binding.pry


test_arr = ['all','text','is','here','so','you','can','test','it']


whatiwant = ['all','text',:is,'here','so',:you,'can','test',:it]

# find every third element
every_third = test_arr.select.with_index{|var,i| (i+1) % 3 == 0}

# convert a string to symbol
p test_arr[2].to_sym

here = test_arr.map.with_index{ |ch, idx| if (idx+1) % 3 == 0 then ch.to_sym else ch.to_s end}

p here
binding.pry
#  do |val|
#   p val.to_sym
# end
# binding.pry
































# now combine these two in order to convert select strings to sym
#   # convert string as method.
#   def sym_meth(var)
#     var.to_sym
#   end
#
#   # or maybe selection method gets own method
#   def sel_meth(var)
#     var.select.with_index{|var,i| (i+1) % 3 == 0}
#   end
#   # stack two methods
#
# test_arr.each {|element| element.to_sym}
#
# binding.pry

# if arr.select.with_index{|var,i| (i+1) % 3 == 0}
# # now call method within select
#   sym_meth(i)
# end
# for ((i+1) % 3 == 0) in test_arr do
#   puts i
# end

# test_arr.step(3) {|x| x.to_sym}

# def test_meth(arr)
#   if arr.each_with_index{|var,i| (i) % 3 == 0} then
#     binding.pry
#     var.to_sym
#   end
# end
#
# test_meth(test_arr)
