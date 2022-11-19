# == Schema Information
#
# Table name: areas
#
#  id              :bigint           not null, primary key
#  descripcion     :string
#  estado          :string(10)
#  nombre          :string(200)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  empresa_id      :bigint           not null
#  user_created_id :integer
#  user_updated_id :integer
#
# Indexes
#
#  index_areas_on_empresa_id  (empresa_id)
#
# Foreign Keys
#
#  fk_rails_...  (empresa_id => empresas.id)
#
class Area < ApplicationRecord
  belongs_to :empresa

  validates_presence_of :nombre, :empresa_id, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:empresa_id], message: "El nombre que intenta registrar ya existe, Verifique!!" }

  has_many :parametros

  def nombre_area_empresa
    "#{self.empresa.nombre.upcase} - #{self.nombre.upcase}"
  end

  def nombre_con_codigo
    "#{self.id} | ÁREA: #{self.nombre.upcase}"
  end
end
