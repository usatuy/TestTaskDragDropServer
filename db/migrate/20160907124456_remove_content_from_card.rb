class RemoveContentFromCard < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :content
  end
end
