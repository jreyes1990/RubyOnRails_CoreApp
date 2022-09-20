# == Schema Information
#
# Table name: opciones
#
#  id              :bigint           not null, primary key
#  controlador     :string(300)
#  descripcion     :string
#  estado          :string(10)
#  nombre          :string(200)
#  path            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  font_awesome_id :integer
#  menu_id         :bigint           not null
#  user_created_id :integer
#  user_updated_id :integer
#
# Indexes
#
#  index_opciones_on_menu_id  (menu_id)
#
# Foreign Keys
#
#  fk_rails_...  (menu_id => menus.id)
#
class Opcion < ApplicationRecord
  belongs_to :menu
  belongs_to :font_awesome

  validates_presence_of :nombre, :font_awesome_id, :path, :controlador, :menu_id, :descripcion, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:path, :controlador, :menu_id, :estado], message: "El nombre que intenta registrar ya existe, Verifique!!" }

  has_many :menu_roles
  has_many :opcion_cas
end
