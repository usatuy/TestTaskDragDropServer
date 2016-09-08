class CreateCard < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :content
      t.references :list, foreign_key: true
    end
  end
end
