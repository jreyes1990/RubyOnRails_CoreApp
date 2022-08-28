require 'rails_helper'

RSpec.describe "font_awesomes/new", type: :view do
  before(:each) do
    assign(:font_awesome, FontAwesome.new(
      prefijo_nombre: "MyString",
      icono: "MyString",
      termino: "MyString",
      codigo_css: "MyString",
      tipo_icono: "MyString",
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders new font_awesome form" do
    render

    assert_select "form[action=?][method=?]", font_awesomes_path, "post" do

      assert_select "input[name=?]", "font_awesome[prefijo_nombre]"

      assert_select "input[name=?]", "font_awesome[icono]"

      assert_select "input[name=?]", "font_awesome[termino]"

      assert_select "input[name=?]", "font_awesome[codigo_css]"

      assert_select "input[name=?]", "font_awesome[tipo_icono]"

      assert_select "input[name=?]", "font_awesome[user_created_id]"

      assert_select "input[name=?]", "font_awesome[user_updated_id]"

      assert_select "input[name=?]", "font_awesome[estado]"
    end
  end
end
