class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body

      t.timestamps #this is related with the time info  of the blog, be it making or updating
    end
  end
end
