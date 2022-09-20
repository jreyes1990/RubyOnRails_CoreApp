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
require 'rails_helper'

RSpec.describe Opcion, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
