class GameMatrix
  require 'matrix'

  attr_reader :height, :width, :array

  def initialize(height, width)
    @height = height
    @width = width
    @matrix = Matrix.build(@height, @width) { 0 }
    @array = @matrix.to_a
  end

  def output_current_matrix
    puts "Height: #{@height}"
    puts "Width: #{@width}"
    @array.each do |row|
      row_string = ""
      row.each do |element|
        row_string << "#{element} "
      end
      puts row_string
    end
  end

  def update_matrix(start_row, end_row, start_column, end_column, new_element)
    return unless valid_update?(start_row, end_row, start_column, end_column, new_element)
    row_range = [*(start_row - 1)...end_row]
    column_range = [*(start_column - 1)...end_column]
    @array.each_with_index do |row, index|
      if row_range.include? index
        row.each_with_index do |element, index|
          if column_range.include? index
            row[index] = new_element
          end
        end
        @array[index] = row
      end
    end
  end

  private

  def valid_update?(start_row, end_row, start_column, end_column, new_element)
    if start_row < 1 || start_row > end_row || start_row > @height
      puts "Start row is invalid, must be between 1 and #{@height}, and less than the end row."
      return false
    elsif end_row > @height
      puts "End row is invalid, must be equal to or less than #{@height} and greater than start row."
      return false
    elsif start_column < 1 || start_column > end_column || start_column > @width
      puts "DEBUG: #{start_column}, #{end_column}, #{@width}"
      puts "Start column is invalid, must be between 1 and #{@width}, and less than the end column."
      return false
    elsif end_column > @width
      puts "End column is invalid, must be equal to or less than #{@width} and greater than the start column."
      return false
    elsif new_element.chars.length != 1
      puts "New element is invalid, must be 1 character only."
      return false
    end
    true
  end

end