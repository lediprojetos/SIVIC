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

describe SivicModelsController do

  # This should return the minimal set of attributes required to create a valid
  # SivicModel. As you add validations to SivicModel, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "nome_model" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SivicModelsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sivic_models as @sivic_models" do
      sivic_model = SivicModel.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sivic_models).should eq([sivic_model])
    end
  end

  describe "GET show" do
    it "assigns the requested sivic_model as @sivic_model" do
      sivic_model = SivicModel.create! valid_attributes
      get :show, {:id => sivic_model.to_param}, valid_session
      assigns(:sivic_model).should eq(sivic_model)
    end
  end

  describe "GET new" do
    it "assigns a new sivic_model as @sivic_model" do
      get :new, {}, valid_session
      assigns(:sivic_model).should be_a_new(SivicModel)
    end
  end

  describe "GET edit" do
    it "assigns the requested sivic_model as @sivic_model" do
      sivic_model = SivicModel.create! valid_attributes
      get :edit, {:id => sivic_model.to_param}, valid_session
      assigns(:sivic_model).should eq(sivic_model)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SivicModel" do
        expect {
          post :create, {:sivic_model => valid_attributes}, valid_session
        }.to change(SivicModel, :count).by(1)
      end

      it "assigns a newly created sivic_model as @sivic_model" do
        post :create, {:sivic_model => valid_attributes}, valid_session
        assigns(:sivic_model).should be_a(SivicModel)
        assigns(:sivic_model).should be_persisted
      end

      it "redirects to the created sivic_model" do
        post :create, {:sivic_model => valid_attributes}, valid_session
        response.should redirect_to(SivicModel.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sivic_model as @sivic_model" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicModel.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_model => { "nome_model" => "invalid value" }}, valid_session
        assigns(:sivic_model).should be_a_new(SivicModel)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicModel.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_model => { "nome_model" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sivic_model" do
        sivic_model = SivicModel.create! valid_attributes
        # Assuming there are no other sivic_models in the database, this
        # specifies that the SivicModel created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SivicModel.any_instance.should_receive(:update).with({ "nome_model" => "MyString" })
        put :update, {:id => sivic_model.to_param, :sivic_model => { "nome_model" => "MyString" }}, valid_session
      end

      it "assigns the requested sivic_model as @sivic_model" do
        sivic_model = SivicModel.create! valid_attributes
        put :update, {:id => sivic_model.to_param, :sivic_model => valid_attributes}, valid_session
        assigns(:sivic_model).should eq(sivic_model)
      end

      it "redirects to the sivic_model" do
        sivic_model = SivicModel.create! valid_attributes
        put :update, {:id => sivic_model.to_param, :sivic_model => valid_attributes}, valid_session
        response.should redirect_to(sivic_model)
      end
    end

    describe "with invalid params" do
      it "assigns the sivic_model as @sivic_model" do
        sivic_model = SivicModel.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicModel.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_model.to_param, :sivic_model => { "nome_model" => "invalid value" }}, valid_session
        assigns(:sivic_model).should eq(sivic_model)
      end

      it "re-renders the 'edit' template" do
        sivic_model = SivicModel.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicModel.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_model.to_param, :sivic_model => { "nome_model" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sivic_model" do
      sivic_model = SivicModel.create! valid_attributes
      expect {
        delete :destroy, {:id => sivic_model.to_param}, valid_session
      }.to change(SivicModel, :count).by(-1)
    end

    it "redirects to the sivic_models list" do
      sivic_model = SivicModel.create! valid_attributes
      delete :destroy, {:id => sivic_model.to_param}, valid_session
      response.should redirect_to(sivic_models_url)
    end
  end

end
