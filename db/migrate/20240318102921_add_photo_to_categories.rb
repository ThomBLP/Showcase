class AddPhotoToCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :categories, :photo, :string
  end
end
