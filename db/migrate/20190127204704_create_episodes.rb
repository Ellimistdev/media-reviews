class CreateEpisodes < ActiveRecord::Migration[5.2]
  def change
    create_table :episodes do |t|
      t.string :title
      t.belongs_to :medium, foreign_key: true
      t.belongs_to :season, foreign_key: true

      t.timestamps
    end
  end
end
