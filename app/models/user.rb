class User < ApplicationRecord
  has_many :transactions
  has_many :businesses, through: :transactions
  has_secure_password

  validates :username, presence: true, uniqueness: true, length: { in: 6..20 }

  def create_transaction(business, amount)

    business = Business.find_by(name: business)

    if self.balance >= amount
      self_balance = self.balance - amount
      business_balance = business.balance + amount
      Transaction.create(user_id: self.id, business_id: business.id, amount: amount)
      business.update(balance: business_balance)
      self.update(balance: self_balance)
    else
      return "Transaction rejected"
    end
  end

end
