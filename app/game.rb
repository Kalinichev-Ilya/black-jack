require_relative 'user'
require_relative 'card'

class Game
  attr_reader :player, :dealer, :deck, :bank
  attr_writer :bank

  def initialize(name)
    @player = User.new(name, :player)
    @dealer = User.new('Dealer', :dealer)
    @deck = build_deck
    @bank = 0
  end

  def run
    launching player
    launching dealer

    player.parlay
    dealer.parlay
    @bank += 20

    loop do
      puts 'Player cards:'
      player.cards
      puts ''
      puts "You score: #{player.score}"

      puts 'Select an action:'
      puts '1. Skip'
      puts '2. Get card'
      puts '3. Show cards'
      input = gets.chomp.to_i

      case input
      when 1
        player.skipped
        player.parlay
        @bank += 10
      when 2
        new_card = card(deck)
        player.add_card(new_card)
      when 3
        break
      end

      if dealer.score < 17
        dealer.add_card(card(deck))
      else
        dealer.skipped
        dealer.parlay
        @bank += 10
      end

      break if end_game?(player, dealer)
    end
    puts "Dealer score: #{dealer.score}, you: #{player.score}"

    end_game
  end

  private

  def end_game?(player, dealer)
    player.hands.size && dealer.hands.size > 3
  end

  def end_game
    if dealer.score > 21 || player.score == 21 || player.score > dealer.score
      winner player
      return_card player
      return_card dealer
    elsif player.score < dealer.score || player.score > 21
      winner dealer
      return_card player
      return_card dealer
    end
  end

  def winner(player)
    puts "#{player.name} win!"
    player.cash = player.cash + bank
    puts "#{player.name} cash: #{player.cash}"
  end

  def return_card(player)
    (@deck << player.hands).flatten
  end

  def build_deck
    deck = %w{♠ ♥ ♣ ♦}.map do |suite|
      %w{A K Q J 10 9 8 7 6 5 4 3 2}.map do |type|
        Card.new(suite, type)
      end
    end

    deck.flatten
  end

  def card(deck)
    card = deck.sample
    deck.delete card
  end

  def launching(player)
    card_one = card(deck)
    card_two = card(deck)
    player.add_card(card_one)
    player.add_card(card_two)
  end
end
