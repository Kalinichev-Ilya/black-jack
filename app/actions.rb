module Actions
  CARDS = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  
  def rate(cards)
    rate = 0
    ten_points = %w(J K Q)
    cards.each do |card|
      if card != 'A'
        rate = rate + card.to_i unless ten_points.include? card
        rate = rate + 10 if ten_points.include? card
      end
      if card == 'A'
        rate = rate + 1 if rate > 10
        rate = rate + 11 if rate <= 10
      end
    end
    rate
  end

  def card
    card = CARDS.sample
    CARDS.delete card
  end
end
