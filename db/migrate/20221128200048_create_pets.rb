class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :likes
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
