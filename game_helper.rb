def get_matrix_height
  height = nil
  until height.class == Integer
    puts "Please enter the height"
    input = gets.chomp
    height = input.to_i rescue "This is not a valid integer"
  end
  height
end

def get_matrix_width
  width = nil
  until width.class == Integer
    puts "Please enter the width"
    input = gets.chomp
    width = input.to_i rescue "This is not a valid integer"
  end
  width
end

def valid_input_for_update?(input)
  # update rows 1 to 3 columns 2 to 4 with character A
  elements = [2, 4, 6, 8]
  arr = input.split
  elements.each do |element|
    return false unless arr[element].length == 1 && arr[element].to_i > 0
  end
  arr[11].length == 1
end