class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :email
      t.boolean :subscribe
      t.string :topic
      t.text :wiadomosc

      t.timestamps null: false
    end
  end
end
