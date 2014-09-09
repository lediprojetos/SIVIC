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

describe SivicUserpermissaosController do

  # This should return the minimal set of attributes required to create a valid
  # SivicUserpermissao. As you add validations to SivicUserpermissao, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "sivic_permissao" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SivicUserpermissaosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sivic_userpermissaos as @sivic_userpermissaos" do
      sivic_userpermissao = SivicUserpermissao.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sivic_userpermissaos).should eq([sivic_userpermissao])
    end
  end

  describe "GET show" do
    it "assigns the requested sivic_userpermissao as @sivic_userpermissao" do
      sivic_userpermissao = SivicUserpermissao.create! valid_attributes
      get :show, {:id => sivic_userpermissao.to_param}, valid_session
      assigns(:sivic_userpermissao).should eq(sivic_userpermissao)
    end
  end

  describe "GET new" do
    it "assigns a new sivic_userpermissao as @sivic_userpermissao" do
      get :new, {}, valid_session
      assigns(:sivic_userpermissao).should be_a_new(SivicUserpermissao)
    end
  end

  describe "GET edit" do
    it "assigns the requested sivic_userpermissao as @sivic_userpermissao" do
      sivic_userpermissao = SivicUserpermissao.create! valid_attributes
      get :edit, {:id => sivic_userpermissao.to_param}, valid_session
      assigns(:sivic_userpermissao).should eq(sivic_userpermissao)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SivicUserpermissao" do
        expect {
          post :create, {:sivic_userpermissao => valid_attributes}, valid_session
        }.to change(SivicUserpermissao, :count).by(1)
      end

      it "assigns a newly created sivic_userpermissao as @sivic_userpermissao" do
        post :create, {:sivic_userpermissao => valid_attributes}, valid_session
        assigns(:sivic_userpermissao).should be_a(SivicUserpermissao)
        assigns(:sivic_userpermissao).should be_persisted
      end

      it "redirects to the created sivic_userpermissao" do
        post :create, {:sivic_userpermissao => valid_attributes}, valid_session
        response.should redirect_to(SivicUserpermissao.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sivic_userpermissao as @sivic_userpermissao" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicUserpermissao.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_userpermissao => { "sivic_permissao" => "invalid value" }}, valid_session
        assigns(:sivic_userpermissao).should be_a_new(SivicUserpermissao)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicUserpermissao.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_userpermissao => { "sivic_permissao" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sivic_userpermissao" do
        sivic_userpermissao = SivicUserpermissao.create! valid_attributes
        # Assuming there are no other sivic_userpermissaos in the database, this
        # specifies that the SivicUserpermissao created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SivicUserpermissao.any_instance.should_receive(:update).with({ "sivic_permissao" => "" })
        put :update, {:id => sivic_userpermissao.to_param, :sivic_userpermissao => { "sivic_permissao" => "" }}, valid_session
      end

      it "assigns the requested sivic_userpermissao as @sivic_userpermissao" do
        sivic_userpermissao = SivicUserpermissao.create! valid_attributes
        put :update, {:id => sivic_userpermissao.to_param, :sivic_userpermissao => valid_attributes}, valid_session
        assigns(:sivic_userpermissao).should eq(sivic_userpermissao)
      end

      it "redirects to the sivic_userpermissao" do
        sivic_userpermissao = SivicUserpermissao.create! valid_attributes
        put :update, {:id => sivic_userpermissao.to_param, :sivic_userpermissao => valid_attributes}, valid_session
        response.should redirect_to(sivic_userpermissao)
      end
    end

    describe "with invalid params" do
      it "assigns the sivic_userpermissao as @sivic_userpermissao" do
        sivic_userpermissao = SivicUserpermissao.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicUserpermissao.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_userpermissao.to_param, :sivic_userpermissao => { "sivic_permissao" => "invalid value" }}, valid_session
        assigns(:sivic_userpermissao).should eq(sivic_userpermissao)
      end

      it "re-renders the 'edit' template" do
        sivic_userpermissao = SivicUserpermissao.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicUserpermissao.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_userpermissao.to_param, :sivic_userpermissao => { "sivic_permissao" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sivic_userpermissao" do
      sivic_userpermissao = SivicUserpermissao.create! valid_attributes
      expect {
        delete :destroy, {:id => sivic_userpermissao.to_param}, valid_session
      }.to change(SivicUserpermissao, :count).by(-1)
    end

    it "redirects to the sivic_userpermissaos list" do
      sivic_userpermissao = SivicUserpermissao.create! valid_attributes
      delete :destroy, {:id => sivic_userpermissao.to_param}, valid_session
      response.should redirect_to(sivic_userpermissaos_url)
    end
  end

end