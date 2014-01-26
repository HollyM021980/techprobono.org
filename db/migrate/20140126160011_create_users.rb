class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :professional_headline
      t.integer :account_type

      t.timestamps
    end
  end
end
