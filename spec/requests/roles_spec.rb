require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/roles", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Rol. As you add validations to Rol, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Rol.create! valid_attributes
      get roles_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      rol = Rol.create! valid_attributes
      get rol_url(rol)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_rol_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      rol = Rol.create! valid_attributes
      get edit_rol_url(rol)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Rol" do
        expect {
          post roles_url, params: { rol: valid_attributes }
        }.to change(Rol, :count).by(1)
      end

      it "redirects to the created rol" do
        post roles_url, params: { rol: valid_attributes }
        expect(response).to redirect_to(rol_url(Rol.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Rol" do
        expect {
          post roles_url, params: { rol: invalid_attributes }
        }.to change(Rol, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post roles_url, params: { rol: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested rol" do
        rol = Rol.create! valid_attributes
        patch rol_url(rol), params: { rol: new_attributes }
        rol.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the rol" do
        rol = Rol.create! valid_attributes
        patch rol_url(rol), params: { rol: new_attributes }
        rol.reload
        expect(response).to redirect_to(rol_url(rol))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        rol = Rol.create! valid_attributes
        patch rol_url(rol), params: { rol: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested rol" do
      rol = Rol.create! valid_attributes
      expect {
        delete rol_url(rol)
      }.to change(Rol, :count).by(-1)
    end

    it "redirects to the roles list" do
      rol = Rol.create! valid_attributes
      delete rol_url(rol)
      expect(response).to redirect_to(roles_url)
    end
  end
end
