class CreateUniqueIdentifiers < ActiveRecord::Migration[6.0]
  def change
    create_table :unique_identifiers do |t|
      t.string :unique_id
      t.timestamps
    end
  end
end
