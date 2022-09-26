# == Schema Information
#
# Table name: menu_roles
#
#  id              :bigint           not null, primary key
#  descripcion     :string
#  estado          :string(10)
#  menu_padre      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  opcion_id       :bigint           not null
#  rol_id          :bigint           not null
#  user_created_id :integer
#  user_updated_id :integer
#
# Indexes
#
#  index_menu_roles_on_opcion_id  (opcion_id)
#  index_menu_roles_on_rol_id     (rol_id)
#
# Foreign Keys
#
#  fk_rails_...  (opcion_id => opciones.id)
#  fk_rails_...  (rol_id => roles.id)
#
class MenuRol < ApplicationRecord
  belongs_to :rol
  belongs_to :opcion
  belongs_to :menu, :foreign_key => "menu_padre"

  validates_presence_of :menu_padre, :rol_id, :opcion_id, message: ": este campo es obligatorio"
  validates :rol_id, uniqueness: {case_sensitive: false, scope: [:menu_padre,:opcion_id,:estado], message: "Error, solo puede asignar una la opcion al rol, Verifique!!." }
end
