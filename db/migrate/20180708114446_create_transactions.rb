class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :user_id
      t.integer :business_id
      t.float :amount

      t.timestamps
    end
  end
end
