class AddUserToCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :categories, :user, :string
  end
end
