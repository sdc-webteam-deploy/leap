class CreateReviewLines < ActiveRecord::Migration
  def self.up
    create_table :review_lines do |t|
      t.integer :person_id
      t.integer :review_id
      t.integer :mis_id
      t.string :title
      t.date :published_at
      t.string :teachers
      t.text :comments
      t.integer :quality
      t.integer :attitude
      t.integer :punctuality
      t.integer :completion
      t.timestamps
    end
  end

  def self.down
    drop_table :review_lines
  end
end