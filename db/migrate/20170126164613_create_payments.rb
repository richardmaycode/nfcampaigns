class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.string :first_name
      t.string :last_name
      t.string :last4
      t.integer :confirmation_number
      t.decimal :amount, precision: 12, scale: 3
      t.boolean :success
      t.string :authorization_code
      
      t.references :payable, polymorphic:true, index: true
      t.timestamps
    end
  end
end
