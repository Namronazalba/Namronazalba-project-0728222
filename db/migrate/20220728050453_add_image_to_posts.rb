class AddImageToPosts < ActiveRecord::Migration[6.1]
  def change
      # rename_column :posts, :title, :title_rename
      add_column :posts, :image , :string

  end
end
