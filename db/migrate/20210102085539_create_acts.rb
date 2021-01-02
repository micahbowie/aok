class CreateActs < ActiveRecord::Migration[6.0]
  def change
    create_table :acts do |t|
      t.integer :unique_identifier_id
      t.string :uid_reference
      t.string :giver
      t.text :message
      t.string :instagram_username

      t.timestamps
    end
  end
end
