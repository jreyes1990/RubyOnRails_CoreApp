require 'rails_helper'

RSpec.describe "menu_roles/show", type: :view do
  before(:each) do
    @menu_rol = assign(:menu_rol, MenuRol.create!(
      menu_padre: 2,
      descripcion: "Descripcion",
      user_created_id: 3,
      user_updated_id: 4,
      estado: "Estado",
      rol: nil,
      opcion: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Descripcion/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
