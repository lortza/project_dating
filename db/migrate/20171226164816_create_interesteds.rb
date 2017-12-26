class CreateInteresteds < ActiveRecord::Migration[5.1]
  def change
    create_table :interesteds do |t|
      t.integer :interester_id
      t.integer :interestee_id

      t.timestamps
    end
    add_index :interesteds, [:interester_id, :interestee_id], unique: true
  end
end
