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

RSpec.describe "/font_awesomes", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # FontAwesome. As you add validations to FontAwesome, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      FontAwesome.create! valid_attributes
      get font_awesomes_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      font_awesome = FontAwesome.create! valid_attributes
      get font_awesome_url(font_awesome)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_font_awesome_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      font_awesome = FontAwesome.create! valid_attributes
      get edit_font_awesome_url(font_awesome)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new FontAwesome" do
        expect {
          post font_awesomes_url, params: { font_awesome: valid_attributes }
        }.to change(FontAwesome, :count).by(1)
      end

      it "redirects to the created font_awesome" do
        post font_awesomes_url, params: { font_awesome: valid_attributes }
        expect(response).to redirect_to(font_awesome_url(FontAwesome.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new FontAwesome" do
        expect {
          post font_awesomes_url, params: { font_awesome: invalid_attributes }
        }.to change(FontAwesome, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post font_awesomes_url, params: { font_awesome: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested font_awesome" do
        font_awesome = FontAwesome.create! valid_attributes
        patch font_awesome_url(font_awesome), params: { font_awesome: new_attributes }
        font_awesome.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the font_awesome" do
        font_awesome = FontAwesome.create! valid_attributes
        patch font_awesome_url(font_awesome), params: { font_awesome: new_attributes }
        font_awesome.reload
        expect(response).to redirect_to(font_awesome_url(font_awesome))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        font_awesome = FontAwesome.create! valid_attributes
        patch font_awesome_url(font_awesome), params: { font_awesome: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested font_awesome" do
      font_awesome = FontAwesome.create! valid_attributes
      expect {
        delete font_awesome_url(font_awesome)
      }.to change(FontAwesome, :count).by(-1)
    end

    it "redirects to the font_awesomes list" do
      font_awesome = FontAwesome.create! valid_attributes
      delete font_awesome_url(font_awesome)
      expect(response).to redirect_to(font_awesomes_url)
    end
  end
end
