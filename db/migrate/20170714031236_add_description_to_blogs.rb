class AddDescriptionToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :description, :text
    add_column :blogs, :body, :text
  end
end
