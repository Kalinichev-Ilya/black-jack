require_relative 'user'
require_relative 'actions'

class Game
  # Создать игрока
  # Спросить имя
  # Создать диллера
  puts 'What is your name?'
  name = gets.chomp
  player = User.new(name)
  dealer = User.new('Dealer')

  
  # Выдать 2 случайные карты пользователю
  #   Пользователь может их видеть
  include Actions
  
  card_one = card
  card_two = card
  player.add_card(card_one)
  player.add_card(card_two)
  
  puts "You cards: #{player.hands}"
  
  # Выдать 2 случайные карты диллеру
  card_one = card
  card_two = card
  dealer.add_card(card_one)
  dealer.add_card(card_two)
  
  # Пользователь их не видит
  puts "Dealer get two cards"
  
  # Показывать пользователю сумму своих очков
  puts "You score: #{player.score}"
  
  # После раздачи делается ставка в банк 10$
  # от игрока и диллера
  bank = 0
  player.parlay
  dealer.parlay
  bank = 20
  
  
  # Ход игрока
  # Спросить у пользователя:
  #   Пропустить
  # Добавить карту
  # Открыть карты
  
  # Ходит диллер
  # На основании карт принять решение что выбрать из ходов
  
  # Игра заканчивается при условии 3х карт у игроков
  # Или если выбран ход - Открыть карты
  
  # Если игра кончилась, вывести резульат
  # Кол-во очков пользователя и диллера
  # Написать кто выйграл
  
  # Спрашиваем хочет ли еще раз сыграть иначе завершаем цикл
end
