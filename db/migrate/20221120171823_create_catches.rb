class CreateCatches < ActiveRecord::Migration[6.0]
  def change
    create_table :catches do |t|
      t.integer :area,          null: false
      t.string :detail_area
      t.string :fish_type
      t.string :fish_catch
      t.string :date_and_time
      t.text :comment
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
