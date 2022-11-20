class CreateCatches < ActiveRecord::Migration[6.0]
  def change
    create_table :catches do |t|

      t.timestamps
    end
  end
end
