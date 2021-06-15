class Cell
  attr_accessor :position, :neighbours, :state

  def initialize(state, position, neighbours: [])
    @state = state
    @position = position
    @neighbours = neighbours
  end

  def live!
    @state = :alive
  end

  def die!
    @state = :dead
  end

  def alive?
    @state == :alive
  end

  def dead?
    !alive?
  end
end
