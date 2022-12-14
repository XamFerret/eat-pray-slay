class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :decision, null: false, foreign_key: true

      t.timestamps
    end
  end
end
