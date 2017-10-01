require_relative 'user'
require_relative 'card'

class Game
  attr_reader :player, :dealer, :deck

  def initialize
    @player = User.new('Player', :player)
    @dealer = User.new('Dealer', :dealer)
    @deck = build_deck
  end

  def run
    # Создать игрока
    # Спросить имя
    # Создать диллера
    # puts 'What is your name?'
    # name = gets.chomp

    # Выдать 2 случайные карты пользователю
    # Пользователь может их видеть

    card_one = card(deck)
    card_two = card(deck)
    @player.add_card(card_one)
    @player.add_card(card_two)

    # Выдать 2 случайные карты диллеру
    card_one = card(deck)
    card_two = card(deck)
    @dealer.add_card(card_one)
    @dealer.add_card(card_two)

    # Пользователь их не видит
    puts 'Dealer get two cards'

    # Показывать пользователю сумму своих очков
    puts "You score: #{@player.score}"
    puts "Dealer score: #{@dealer.score}"

    # После раздачи делается ставка в банк 10$
    # от игрока и диллера
    bank = 0
    @player.parlay
    @dealer.parlay
    bank = bank + 20

    puts "#{player.cash}: #{dealer.cash}"

    loop do
      puts "You cards: #{@player.cards}"
      # Ход игрока
      # Спросить у пользователя:

      # Пропустить
      # Добавить карту
      # Открыть карты
      puts 'Select an action:'
      puts '1. Skip'
      puts '2. Get card'
      puts '3. Show cards'
      input = gets.chomp.to_i

      case input
      when 1
        player.skipped
      when 2
        player.add_card(card(deck))
      when 3
        break
      end

      # Ходит диллер
      # На основании карт принять решение что выбрать из ходов
      if dealer.score < 17
        dealer.add_card(card(deck))
      else
        dealer.skipped
      end

      # Игра заканчивается при условии 3х карт у игроков
      # Или если выбран ход - Открыть карты
      break if end_game?(player, dealer)
    end
    puts "Dealer score: #{dealer.score}, you: #{player.score}"

    end_game
  end

  # Если игра кончилась, вывести резульат
  # Кол-во очков пользователя и диллера
  # Написать кто выйграл

  # Спрашиваем хочет ли еще раз сыграть иначе завершаем цикл

  def end_game?(player, dealer)
    player.hands.size && dealer.hands.size > 3
  end

  def end_game
    if dealer.score > 21 || player.score == 21
      puts 'You win!'
    elsif player.score < dealer.score || player.score > 21
      puts 'Delader win!'
    end
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
end

game = Game.new
game.run
