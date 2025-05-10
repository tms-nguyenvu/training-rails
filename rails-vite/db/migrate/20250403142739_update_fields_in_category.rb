class UpdateFieldsInCategory < ActiveRecord::Migration[7.2]
  def change
    add_column :categories, :name, :string
    add_column :categories, :description, :text
  end
end
