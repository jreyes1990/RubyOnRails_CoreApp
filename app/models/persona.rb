# == Schema Information
#
# Table name: personas
#
#  id              :bigint           not null, primary key
#  apellido        :string(100)
#  direccion       :string
#  estado          :string(10)
#  foto            :string
#  nombre          :string(100)
#  telefono        :integer
#  token           :string(1000)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_created_id :integer
#  user_id         :bigint           not null
#  user_updated_id :integer
#
# Indexes
#
#  index_personas_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Persona < ApplicationRecord
  mount_uploader :foto, FotoUploader
  belongs_to :user
  has_many :personas_areas
  validates :nombre, :apellido, :direccion, :telefono, presence: false

  def nombre_completo
    "#{self.nombre} #{self.apellido}"
  end

  def nombre_completo_con_email
    "#{self.nombre} #{self.apellido} - #{self.user.email}"
  end
end
