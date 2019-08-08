class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table   :posts do |t|
      t.string     :animal,  null: false, index: true
      t.string     :image,   null: false
      t.string     :habitat, null: false
      t.text       :detail,  null: false
      t.integer    :rate,    null: false
      t.references :user,    foreign_key: true
      t.timestamps
    end
  end
end
