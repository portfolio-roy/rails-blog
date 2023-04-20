class AddPhotoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :photo, :string, default: "//source.unsplash.com/featured/?abstract"
  end
end
