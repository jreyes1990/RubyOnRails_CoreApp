# == Schema Information
#
# Table name: empresas
#
#  id              :bigint           not null, primary key
#  codigo_empresa  :integer
#  descripcion     :string
#  estado          :string(10)
#  nombre          :string(200)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_created_id :integer
#  user_updated_id :integer
#
class Empresa < ApplicationRecord
  validates_presence_of :nombre, :codigo_empresa, message: ": este campo es obligatorio"
  validates :nombre, uniqueness: {case_sensitive: false, scope: [:codigo_empresa], message: "El nombre que intenta registrar ya existe, Verifique!!" }

  has_many :areas, dependent: :destroy

  def informacion_empresa
    "CÓDIGO: " + "#{self.id}" + " #{self.nombre.upcase}"
  end

  def empresa_con_codigo
    "#{self.id} | #{self.nombre.upcase}"
  end
end
