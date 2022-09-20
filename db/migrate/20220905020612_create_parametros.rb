class CreateParametros < ActiveRecord::Migration[6.0]
  def change
    create_table :parametros do |t|
      t.string :view_default
      t.string :ruta_predeterminada, limit: 100
      t.integer :area_id
      t.string :nombre_area
      t.integer :empresa_id
      t.string :nombre_empresa
      t.integer :user_created_id
      t.integer :user_updated_id
      t.string :estado, limit: 10
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
