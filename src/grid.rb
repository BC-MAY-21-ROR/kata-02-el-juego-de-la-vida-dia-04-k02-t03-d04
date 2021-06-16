# frozen_string_literal: true

require_relative './reader'
require_relative './cell'

# Create to draw the cells's board

class Grid
  def draw
    rows = Reader.new.read_file
    first_board = Array.new(rows.length) { Array.new(rows[0].length) }
    rows.each_with_index do |row, index|
      row.each_char.with_index do |cell, column_index|
        created_cell = Cell.new(assign_state(cell), assign_position(index, column_index))
        first_board[index][column_index] = created_cell
      end
    end
    first_board
  end

  def draw_board
    first_board = draw
    first_board.each_with_index do |row, index|
      row.each_with_index do |_, column_index|
        print "#{first_board[index][column_index].position} "
      end
    end
  end

  def assign_state(cell)
    cell == '*' ? :alive : :dead
  end

  def assign_position(row, column)
    { x: row, y: column }
  end

  def set_neighbours_on_cells!
    neighbour_offset = [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]
    cells = draw_board
    cells.each_with_index do |rows, index|
      rows.each do |_cell, column_index|
        surrounding_locations = neighbour_offset.map do |e|
          { x: e[1] + cells[index, column_index].position[:x],
            y: e[0] + cells[index, column_index].position[:y] }
        end
        puts cells[index, column_index].position[:x]
        cells[index, column_index].neighbours = surrounding_locations.select do |ref|
          ref[:x] >= 0 && ref[:y] >= 0 && ref[:x] < @rows && ref[:y] < @columns
        end
      end
    end
  end
end

Grid.new.set_neighbours_on_cells!
