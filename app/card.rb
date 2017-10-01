class Card
  attr_reader :suit, :type

  def initialize(suit, type)
    @suit = suit
    @type = type
  end

  def to_s
    "#{suit}#{type}"
  end
end
