require_relative 'actions'

class User
  include Actions
  
  attr_reader :name, :score, :cash, :hands
  attr_writer :cards
  
  def initialize(name)
    @name = name
    @score = 0
    @cash = 100
    @hands = []
    @rate = 0
  end

  def add_card(card)
    @hands << card
  end
  
  def score
    rate @hands
  end
  
  def parlay
    @cash = @cash - 10
  end
end

user = User.new '123'
user.add_card '2'
user.add_card 'Q'
puts user.score
