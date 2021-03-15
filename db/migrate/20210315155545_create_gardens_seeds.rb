class CreateGardensSeeds < ActiveRecord::Migration[6.1]
  def change
    create_table :gardens_seeds do |t|
      t.belongs_to :garden
      t.belongs_to :seed
      t.timestamps
    end
  end
end
