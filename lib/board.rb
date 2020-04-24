# frozen_string_literal: true

module TicTacToe
  class Board
    def initialize(cells = nil)
      @cells = cells || Array.new(3, Array.new(3, nil))
    end

    def cell(point_x, point_y)
      @cells[point_y][point_x]
    end

    def mark(point_x, point_y, mark)
      marked_cells = @cells
      marked_cells[point_y][point_x] = mark

      Board.new(marked_cells)
    end

    def cell_marked?(point_x, point_y, mark)
      cell(point_x, point_y) == mark
    end

    def horizontal_bingo?(mark)
      @cells.each do |column|
        return true if column.count(mark) == 3
      end

      false
    end

    def vertical_bingo?(mark)
      0.upto(2) do |n|
        if cell(n, 0) == mark &&
           cell(n, 1) == mark &&
           cell(n, 2) == mark

          return true
        end
      end

      false
    end

    def diagonal_bingo?(mark)
      [0, 2].each do |n|
        if cell(n, 0) &&
           cell(1, 1) == mark &&
           @cells[2].reverse[n] == mark # [o x x] -> [x x o]

          return true
        end
      end

      false
    end

    def bingo?(mark)
      horizontal_bingo?(mark) || vertical_bingo?(mark) || diagonal_bingo?(mark)
    end
  end
end
