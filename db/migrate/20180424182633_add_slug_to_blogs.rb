class AddSlugToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_column :blogs, :slug, :string #add a column to the blog table, the attribute named slug
    add_index :blogs, :slug, unique: true #as we said the slug value to be unique.
  end
end
