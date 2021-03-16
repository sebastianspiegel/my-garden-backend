class CreateSeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :seeds do |t|
      t.string :common_name 
      t.string :latin_name
      t.string :img
      t.text :info
      t.timestamps
    end
  end
end
