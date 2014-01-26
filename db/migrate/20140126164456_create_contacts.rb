class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :contact_type
      t.string :value
      t.string :contactable_type
      t.integer :contactable_id

      t.timestamps
    end
  end
end
