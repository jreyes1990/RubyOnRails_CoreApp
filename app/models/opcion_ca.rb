# == Schema Information
#
# Table name: opcion_cas
#
#  id              :bigint           not null, primary key
#  descripcion     :string
#  estado          :string(10)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  atributo_id     :bigint           not null
#  componente_id   :bigint           not null
#  opcion_id       :bigint           not null
#  user_created_id :integer
#  user_updated_id :integer
#
# Indexes
#
#  index_opcion_cas_on_atributo_id    (atributo_id)
#  index_opcion_cas_on_componente_id  (componente_id)
#  index_opcion_cas_on_opcion_id      (opcion_id)
#
# Foreign Keys
#
#  fk_rails_...  (atributo_id => atributos.id)
#  fk_rails_...  (componente_id => componentes.id)
#  fk_rails_...  (opcion_id => opciones.id)
#
class OpcionCa < ApplicationRecord
  belongs_to :componente
  belongs_to :atributo
  belongs_to :opcion

  validates_presence_of :opcion_id, :componente_id, :atributo_id, message: ": este campo es obligatorio"
  validates_uniqueness_of :opcion_id, :scope => [:componente_id, :atributo_id], :message => "Error, solo puede asignar una vez el componente y el atributo al formulario, Verifique!!."
end
