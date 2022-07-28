class AddUrlToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :url_short, :string
  end
end
