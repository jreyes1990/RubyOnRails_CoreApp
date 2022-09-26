# == Schema Information
#
# Table name: font_awesomes
#
#  id              :bigint           not null, primary key
#  codigo_css      :string(25)
#  estado          :string(10)
#  icono           :string(50)
#  prefijo_nombre  :string(100)
#  termino         :string
#  tipo_icono      :string(50)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_created_id :integer
#  user_updated_id :integer
#
class FontAwesome < ApplicationRecord
  validates_presence_of :prefijo_nombre, :icono, :codigo_css, :tipo_icono, message: ": este campo es obligatorio"
  validates :icono, uniqueness: {case_sensitive: false, scope: [:prefijo_nombre, :codigo_css, :tipo_icono, :estado], message: "El icono que intenta registrar ya existe" }

  has_many :menus
  has_many :opciones

  def desc_icono
    "#{self.id}:  #{self.icono}; Termino: #{self.termino}"
  end
end
