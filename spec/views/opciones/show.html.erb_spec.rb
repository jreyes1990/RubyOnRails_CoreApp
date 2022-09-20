require 'rails_helper'

RSpec.describe "opciones/show", type: :view do
  before(:each) do
    @opcion = assign(:opcion, Opcion.create!(
      nombre: "Nombre",
      font_awesome_id: 2,
      path: "Path",
      descripcion: "Descripcion",
      controlador: "Controlador",
      user_created_id: 3,
      user_updated_id: 4,
      estado: "Estado",
      menu: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Path/)
    expect(rendered).to match(/Descripcion/)
    expect(rendered).to match(/Controlador/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Estado/)
    expect(rendered).to match(//)
  end
end
