# frozen_string_literal: true

require File.join(File.dirname(__FILE__), 'board')

class Bishop
  def initialize(origin_position, target_position)
    @origin_position = origin_position.to_i
    @target_position = target_position.to_i
  end

  def movements
    movements_number = first_way_movements
    return p 'Movements count ==> ' + movements_number.to_s if movements_number > 0

    movements_number = second_way_movements
    return p 'Movements count ==> ' + movements_number.to_s if movements_number > 0

    p 'Invalid Movement'
  end

  private

  def first_way_movements
    origin_diagonal = diagonal(@origin_position)
    target_diagonal = inverted_diagonal(@target_position)
    movements_count(origin_diagonal, target_diagonal)
  end

  def second_way_movements
    origin_diagonal = inverted_diagonal(@origin_position)
    target_diagonal = diagonal(@target_position)
    movements_count(origin_diagonal, target_diagonal)
  end

  def movements_count(origin_diagonal, target_diagonal)
    intersection_list = origin_diagonal & target_diagonal
    return 0 if intersection_list.count.zero?
    return 1 if intersection_list.first.eql? @target_position

    2
  end

  def diagonal(position)
    diagonal_positions_up(position - 9, 9) | [position] | diagonal_positions_down(position + 9, 9)
  end

  def inverted_diagonal(position)
    diagonal_positions_up(position - 7, 7) | [position] | diagonal_positions_down(position + 7, 7)
  end

  def diagonal_positions_up(position, increment)
    diagonal_positions(position, -increment)
  end

  def diagonal_positions_down(position, increment)
    diagonal_positions(position, increment)
  end

  def diagonal_positions(position, increment)
    return [] unless position.positive? && position <= 64
    return [position] if Board.borders.include?(position)

    [position] | diagonal_positions(position + increment, increment)
  end
end
