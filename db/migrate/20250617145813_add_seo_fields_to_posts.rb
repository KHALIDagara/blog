class AddSeoFieldsToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :slug, :string
    add_index :posts, :slug, unique: true
    add_column :posts, :meta_title, :string
    add_column :posts, :meta_description, :text
    add_column :posts, :image_alt, :string
  end
end
