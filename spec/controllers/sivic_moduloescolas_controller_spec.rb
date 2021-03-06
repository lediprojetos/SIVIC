require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe SivicModuloescolasController do

  # This should return the minimal set of attributes required to create a valid
  # SivicModuloescola. As you add validations to SivicModuloescola, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "sivic_igreja" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SivicModuloescolasController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sivic_moduloescolas as @sivic_moduloescolas" do
      sivic_moduloescola = SivicModuloescola.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sivic_moduloescolas).should eq([sivic_moduloescola])
    end
  end

  describe "GET show" do
    it "assigns the requested sivic_moduloescola as @sivic_moduloescola" do
      sivic_moduloescola = SivicModuloescola.create! valid_attributes
      get :show, {:id => sivic_moduloescola.to_param}, valid_session
      assigns(:sivic_moduloescola).should eq(sivic_moduloescola)
    end
  end

  describe "GET new" do
    it "assigns a new sivic_moduloescola as @sivic_moduloescola" do
      get :new, {}, valid_session
      assigns(:sivic_moduloescola).should be_a_new(SivicModuloescola)
    end
  end

  describe "GET edit" do
    it "assigns the requested sivic_moduloescola as @sivic_moduloescola" do
      sivic_moduloescola = SivicModuloescola.create! valid_attributes
      get :edit, {:id => sivic_moduloescola.to_param}, valid_session
      assigns(:sivic_moduloescola).should eq(sivic_moduloescola)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SivicModuloescola" do
        expect {
          post :create, {:sivic_moduloescola => valid_attributes}, valid_session
        }.to change(SivicModuloescola, :count).by(1)
      end

      it "assigns a newly created sivic_moduloescola as @sivic_moduloescola" do
        post :create, {:sivic_moduloescola => valid_attributes}, valid_session
        assigns(:sivic_moduloescola).should be_a(SivicModuloescola)
        assigns(:sivic_moduloescola).should be_persisted
      end

      it "redirects to the created sivic_moduloescola" do
        post :create, {:sivic_moduloescola => valid_attributes}, valid_session
        response.should redirect_to(SivicModuloescola.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sivic_moduloescola as @sivic_moduloescola" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicModuloescola.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_moduloescola => { "sivic_igreja" => "invalid value" }}, valid_session
        assigns(:sivic_moduloescola).should be_a_new(SivicModuloescola)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicModuloescola.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_moduloescola => { "sivic_igreja" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sivic_moduloescola" do
        sivic_moduloescola = SivicModuloescola.create! valid_attributes
        # Assuming there are no other sivic_moduloescolas in the database, this
        # specifies that the SivicModuloescola created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SivicModuloescola.any_instance.should_receive(:update).with({ "sivic_igreja" => "" })
        put :update, {:id => sivic_moduloescola.to_param, :sivic_moduloescola => { "sivic_igreja" => "" }}, valid_session
      end

      it "assigns the requested sivic_moduloescola as @sivic_moduloescola" do
        sivic_moduloescola = SivicModuloescola.create! valid_attributes
        put :update, {:id => sivic_moduloescola.to_param, :sivic_moduloescola => valid_attributes}, valid_session
        assigns(:sivic_moduloescola).should eq(sivic_moduloescola)
      end

      it "redirects to the sivic_moduloescola" do
        sivic_moduloescola = SivicModuloescola.create! valid_attributes
        put :update, {:id => sivic_moduloescola.to_param, :sivic_moduloescola => valid_attributes}, valid_session
        response.should redirect_to(sivic_moduloescola)
      end
    end

    describe "with invalid params" do
      it "assigns the sivic_moduloescola as @sivic_moduloescola" do
        sivic_moduloescola = SivicModuloescola.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicModuloescola.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_moduloescola.to_param, :sivic_moduloescola => { "sivic_igreja" => "invalid value" }}, valid_session
        assigns(:sivic_moduloescola).should eq(sivic_moduloescola)
      end

      it "re-renders the 'edit' template" do
        sivic_moduloescola = SivicModuloescola.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicModuloescola.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_moduloescola.to_param, :sivic_moduloescola => { "sivic_igreja" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sivic_moduloescola" do
      sivic_moduloescola = SivicModuloescola.create! valid_attributes
      expect {
        delete :destroy, {:id => sivic_moduloescola.to_param}, valid_session
      }.to change(SivicModuloescola, :count).by(-1)
    end

    it "redirects to the sivic_moduloescolas list" do
      sivic_moduloescola = SivicModuloescola.create! valid_attributes
      delete :destroy, {:id => sivic_moduloescola.to_param}, valid_session
      response.should redirect_to(sivic_moduloescolas_url)
    end
  end

end
