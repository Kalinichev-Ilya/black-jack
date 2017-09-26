module Actions
  def rate(cards)
    rate = 0
    ten_points = %w(J K Q)
    cards.each do |card|
      if card != 'A'
        rate = rate + card.to_i
      else
        rate = rate + 10 if ten_points.include? card
      end
      if card == 'A'
        rate = rate + 1 if rate > 10
        rate = rate + 11 if rate <= 10
      end
    end
    rate
  end
end
