class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false, unique: true
      t.string :description, null: false
      t.belongs_to :user

      t.timestamps
    end
    add_unique_index :questions, :title
  end
end
