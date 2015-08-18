class CreateSynonyms < ActiveRecord::Migration
  def change
    create_table :synonyms do |t|
      t.integer :word_id
      t.string :syn1
      t.string :syn2
      t.string :syn3
      t.string :syn4
      t.string :syn5

      t.timestamps null: false
    end
  end
end
