# == Schema Information
#
# Table name: personas_areas
#
#  id              :bigint           not null, primary key
#  estado          :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  area_id         :bigint           not null
#  persona_id      :bigint           not null
#  user_created_id :integer
#  user_updated_id :integer
#
# Indexes
#
#  index_personas_areas_on_area_id     (area_id)
#  index_personas_areas_on_persona_id  (persona_id)
#
# Foreign Keys
#
#  fk_rails_...  (area_id => areas.id)
#  fk_rails_...  (persona_id => personas.id)
#
class PersonasArea < ApplicationRecord
    belongs_to :area
    belongs_to :persona
    validates :persona_id, :area_id, presence: true
    validates_uniqueness_of :persona_id, :scope => :area_id, :message => " error!! solo puede asignar una vez el área"

    def nombre_area
      "#{self.area.empresa.nombre} - #{self.area.nombre} "
    end 

    def user_id
      self.persona.user_id
    end 

    def nombre_persona
      "#{self.persona.nombre} #{self.persona.apellido}"
    end 
    
end
