contents = ARGF.readlines
length = contents.length
dice_base = 6
dice_needed = (Math.log(length) / Math.log(dice_base)).ceil

contents.each_with_index do |name, index|
  mod_index = index
  biject_string = ""
  while mod_index >= dice_base do
    biject_string += ((mod_index % dice_base) + 1).to_s
    mod_index = (mod_index / dice_base).floor
  end
  biject_string += (mod_index + 1).to_s
  while biject_string.length < dice_needed
    biject_string += "1"
  end
  biject_string.reverse!
  puts "#{biject_string} #{name}"
end
