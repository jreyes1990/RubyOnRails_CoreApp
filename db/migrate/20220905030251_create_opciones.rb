class CreateOpciones < ActiveRecord::Migration[6.0]
  def change
    create_table :opciones do |t|
      t.string :nombre, limit: 200
      t.integer :font_awesome_id
      t.string :path
      t.string :descripcion
      t.string :controlador, limit: 300
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :menu, null: false, foreign_key: true

      t.timestamps
    end
  end
end
