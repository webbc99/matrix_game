require_relative 'game_matrix'
require_relative 'game_helper'

puts "Hello, welcome to the matrix painter"
height = get_matrix_height
width = get_matrix_width

g = GameMatrix.new(height, width)

puts "Accepts input in the following formats:"
puts "Update rows X to Y columns A to B with character Z (hint: you can just type the first letter of each word to be quicker!)"
puts "Show matrix (hint: you can also just type 's')"
puts "Enter Q or control+C to quit"

input = ""
until input.downcase == "q"
  input = gets.chomp
  if input.downcase.chars.first == "u"
    if valid_input_for_update?(input)
      # Update command
      arr = input.split
      start_row = arr[2].to_i
      end_row = arr[4].to_i
      start_column = arr[6].to_i
      end_column = arr[8].to_i
      new_element = arr[11]
      g.update_matrix(start_row, end_row, start_column, end_column, new_element)
    else
      puts "That is not a valid input"
    end
  elsif input.downcase.chars.first == "s"
    # Output current matrix
    g.output_current_matrix
  elsif input.downcase == "q"
  else
    # Invalid input
    puts "That is not a valid input"
  end
end

# Q detected so exit program
puts "Bye"