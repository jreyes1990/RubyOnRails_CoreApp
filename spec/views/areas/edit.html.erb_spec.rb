require 'rails_helper'

RSpec.describe "areas/edit", type: :view do
  before(:each) do
    @area = assign(:area, Area.create!(
      nombre: "MyString",
      descripcion: "MyString",
      user_created_id: 1,
      user_updated_id: 1,
      estado: "MyString",
      empresa: nil
    ))
  end

  it "renders the edit area form" do
    render

    assert_select "form[action=?][method=?]", area_path(@area), "post" do

      assert_select "input[name=?]", "area[nombre]"

      assert_select "input[name=?]", "area[descripcion]"

      assert_select "input[name=?]", "area[user_created_id]"

      assert_select "input[name=?]", "area[user_updated_id]"

      assert_select "input[name=?]", "area[estado]"

      assert_select "input[name=?]", "area[empresa_id]"
    end
  end
end
