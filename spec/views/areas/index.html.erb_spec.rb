require 'rails_helper'

RSpec.describe "areas/index", type: :view do
  before(:each) do
    assign(:areas, [
      Area.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        user_created_id: 2,
        user_updated_id: 3,
        estado: "Estado",
        empresa: nil
      ),
      Area.create!(
        nombre: "Nombre",
        descripcion: "Descripcion",
        user_created_id: 2,
        user_updated_id: 3,
        estado: "Estado",
        empresa: nil
      )
    ])
  end

  it "renders a list of areas" do
    render
    assert_select "tr>td", text: "Nombre".to_s, count: 2
    assert_select "tr>td", text: "Descripcion".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: "Estado".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
