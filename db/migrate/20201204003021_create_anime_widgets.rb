class CreateAnimeWidgets < ActiveRecord::Migration[6.0]
  def change
    create_table :anime_widgets do |t|
      t.string :title
      t.text :description
      t.string :image
      t.float :rating

      t.timestamps
    end
  end
end
