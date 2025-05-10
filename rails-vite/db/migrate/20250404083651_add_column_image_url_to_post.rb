class AddColumnImageUrlToPost < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :image_url, :text
  end
end
