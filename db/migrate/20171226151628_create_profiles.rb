class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.references :color, foreign_key: true
      t.references :beer, foreign_key: true
      t.references :food, foreign_key: true
      t.references :cat, foreign_key: true

      t.timestamps
    end
  end
end
