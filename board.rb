# frozen_string_literal: true

class Board
  def self.borders
    @borders ||= border_top | border_right | border_bottom | border_left
  end

  def self.border_top
    (1..8).to_a
  end

  def self.border_right
    (9..49).step(8).to_a
  end

  def self.border_bottom
    (57..64).to_a
  end

  def self.border_left
    (16..56).step(8).to_a
  end
end
