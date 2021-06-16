# frozen_string_literal: true
 
# Create class cell in wich the conditions are defined
class Cell
  attr_reader :position, :neighbours, :state

  def initialize(state, position, neighbours: [])
    @state = state
    @position = position
    @neighbours = neighbours
  end

  def alive
    @state = :alive
  end

  def dead
    @state = :dead
  end

  def alive?
    @state == :alive
  end

  def dead?
    !alive?
  end
end
