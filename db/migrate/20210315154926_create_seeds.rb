class CreateSeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :seeds do |t|
      t.string :name 
      t.timestamps
    end
  end
end
