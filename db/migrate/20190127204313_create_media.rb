class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.string :medium_type
      t.timestamps
    end
  end
end
