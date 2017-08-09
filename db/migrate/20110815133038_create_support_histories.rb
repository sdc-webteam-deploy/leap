class CreateSupportHistories < ActiveRecord::Migration
  def self.up
    create_table :support_histories do |t|
      t.integer :person_id
      t.integer :created_by_id
      t.string :body
      t.string :category
      t.timestamps
    end
    add_index :support_histories, :person_id
  end

  def self.down
    drop_table :support_histories
  end
end
