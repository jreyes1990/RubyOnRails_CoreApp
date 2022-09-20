require 'rails_helper'

RSpec.describe "opciones/index", type: :view do
  before(:each) do
    assign(:opciones, [
      Opcion.create!(
        nombre: "Nombre",
        font_awesome_id: 2,
        path: "Path",
        descripcion: "Descripcion",
        controlador: "Controlador",
        user_created_id: 3,
        user_updated_id: 4,
        estado: "Estado",
        menu: nil
      ),
      Opcion.create!(
        nombre: "Nombre",
        font_awesome_id: 2,
        path: "Path",
        descripcion: "Descripcion",
        controlador: "Controlador",
        user_created_id: 3,
        user_updated_id: 4,
        estado: "Estado",
        menu: nil
      )
    ])
  end

  it "renders a list of opciones" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Path".to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: "Controlador".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
