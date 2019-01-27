class CreateSeasons < ActiveRecord::Migration[5.2]
  def change
    create_table :seasons do |t|
      t.integer :number
      t.belongs_to :medium, foreign_key: true
      t.belongs_to :series, foreign_key: true

      t.timestamps
    end
  end
end
