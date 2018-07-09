class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :business

  attr_accessor :user_id, :business_id, :amount

  def initialize(user_id, business_id, amount=0.00)

    @user_id = user_id
    @business_id = business_id
    @amount = amount

    @user = User.find(@user_id)
    @business = Business.find(@business_id)

    if @user.balance >= @amount
      @user.balance = @user.balance - @amount
      @business.balance = @business.balance + @amount

      @user.save
      @business.save
    else
      return "Transaction rejected"
    end

  end
end #class end
