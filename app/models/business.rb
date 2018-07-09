
class Business < ApplicationRecord
  has_many :items
  has_many :transactions
  has_many :users, through: :transactions

  has_secure_password

  validates :name, presence: true, uniqueness: true, length: { in: 6..20 }

  def create_transaction(user, amount)

    user = User.find_by(username: user)

    if user.balance >= amount
      user_balance = user.balance - amount
      self_balance = self.balance + amount
      Transaction.create(user_id: user.id, business_id: self.id, amount: amount)
      user.update(balance: user_balance)
      self.update(balance: self_balance)
    else
      return "Transaction rejected"
    end
  end
end #class end
