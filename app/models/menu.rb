# == Schema Information
#
# Table name: menus
#
#  id              :bigint           not null, primary key
#  descripcion     :string
#  estado          :string(10)
#  nombre          :string(200)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  font_awesome_id :integer
#  user_created_id :integer
#  user_updated_id :integer
#
class Menu < ApplicationRecord
  belongs_to :font_awesome

  validates_presence_of :nombre, :font_awesome_id, :descripcion, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:font_awesome_id, :estado], message: "El nombre que intenta registrar ya existe, Verifique!!" }

  has_many :menu_roles
end
