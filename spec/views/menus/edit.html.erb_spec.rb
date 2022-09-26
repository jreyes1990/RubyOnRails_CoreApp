require 'rails_helper'

RSpec.describe "menus/edit", type: :view do
  before(:each) do
    @menu = assign(:menu, Menu.create!(
      nombre: "MyString",
      font_awesome_id: 1,
      descripcion: "MyString",
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString"
    ))
  end

  it "renders the edit menu form" do
    render

    assert_select "form[action=?][method=?]", menu_path(@menu), "post" do

      assert_select "input[name=?]", "menu[nombre]"

      assert_select "input[name=?]", "menu[font_awesome_id]"

      assert_select "input[name=?]", "menu[descripcion]"

      assert_select "input[name=?]", "menu[user_created_id]"

      assert_select "input[name=?]", "menu[user_updated_id]"

      assert_select "input[name=?]", "menu[estado]"
    end
  end
end
