require './female_first_names.rb'
 
markov_name = ""
ARGV[0].to_i.times do
  names_array = Names.names.split("\n")
  markov_name = names_array.sample[0]
  loop do
    split_str = markov_name[markov_name.length - 1]
    if markov_name.length > 1
      split_str.prepend(markov_name[markov_name.length - 2])
    end
    names_array = Names.names.split(split_str)
    names_array.shift
    next_sample = names_array.sample
    if next_sample.length > 0
      next_char = next_sample[0]
      break if next_char == "\n"
      markov_name << next_char
    end
  end
  #puts "#{markov_name}, #{markov_name.length}"
  puts "#{markov_name}"
end
