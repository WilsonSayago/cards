class Card < ActiveRecord::Base
  validates :number, presence: :true, uniqueness: true, length: { maximum: 16, minimum: 16 },format: { with:
/\A[+-]?\d+\z/}
  validates :cvv, presence: :true, length: { maximum: 3, minimum: 3 }
  validates :expirate_date, presence: :true

  def get_number_card
    return "************" + self.number.last(4)
  end

  def set_date(month,year)
    self.expirate_date = "01/" + month + "/" + year
  end
end
