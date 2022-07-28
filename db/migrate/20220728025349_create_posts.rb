class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :address
      t.belongs_to :user
      t.belongs_to :category
      # t.belongs_to :region
      # t.belongs_to :city
      t.timestamps
    end
  end
end
