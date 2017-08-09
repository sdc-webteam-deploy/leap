class CreateSupportRequests < ActiveRecord::Migration
  def self.up
    create_table :support_requests do |t|
      t.integer :person_id
      t.integer :created_by_id
      t.string :difficulties
      t.string :sessions
      t.timestamps
    end
    add_index :support_requests, :person_id
  end

  def self.down
    drop_table :support_requests
  end
end
