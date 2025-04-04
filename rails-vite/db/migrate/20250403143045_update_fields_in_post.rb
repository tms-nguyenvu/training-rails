class UpdateFieldsInPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :title, :string
    add_column :posts, :content, :text
    add_column :posts, :published, :boolean
    add_column :posts, :category_id, :integer
    add_column :posts, :user_id, :integer
    
    add_index :posts, :user_id
    add_index :posts, :category_id
  end
end
