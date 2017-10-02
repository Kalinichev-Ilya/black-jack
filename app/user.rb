class User
  attr_reader :name, :cash, :hands, :type
  attr_writer :score, :cash

  def initialize(name, type)
    @name = name
    @cash = 100
    @hands = []
    @rate = 0
    @type = type
  end

  def add_card(card)
    puts "#{name} get card." if type == :dealer
    puts "#{name} get card: #{card}" if type == :player
    @hands << card
  end

  def score
    rate @hands
  end

  def cards
    hands.each { |card| print "#{card} " }
  end

  def parlay
    @cash = @cash - 10
  end

  def dealer?
    @type == :dealer
  end
  
  def skipped
    puts "#{type} skipped."
  end

  def rate(cards)
    rate = 0
    ten_points = %w(J K Q)
    cards.each do |card|
      if card.type != 'A'
        rate = rate + card.type.to_i unless ten_points.include? card.type
        rate = rate + 10 if ten_points.include? card.type
      end
      if card.type == 'A'
        rate = rate + 1 if rate > 10
        rate = rate + 11 if rate <= 10
      end
    end
    rate
  end
end
