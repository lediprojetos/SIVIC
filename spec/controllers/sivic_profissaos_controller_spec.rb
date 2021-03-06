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

describe SivicProfissaosController do

  # This should return the minimal set of attributes required to create a valid
  # SivicProfissao. As you add validations to SivicProfissao, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "profissao" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SivicProfissaosController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sivic_profissaos as @sivic_profissaos" do
      sivic_profissao = SivicProfissao.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sivic_profissaos).should eq([sivic_profissao])
    end
  end

  describe "GET show" do
    it "assigns the requested sivic_profissao as @sivic_profissao" do
      sivic_profissao = SivicProfissao.create! valid_attributes
      get :show, {:id => sivic_profissao.to_param}, valid_session
      assigns(:sivic_profissao).should eq(sivic_profissao)
    end
  end

  describe "GET new" do
    it "assigns a new sivic_profissao as @sivic_profissao" do
      get :new, {}, valid_session
      assigns(:sivic_profissao).should be_a_new(SivicProfissao)
    end
  end

  describe "GET edit" do
    it "assigns the requested sivic_profissao as @sivic_profissao" do
      sivic_profissao = SivicProfissao.create! valid_attributes
      get :edit, {:id => sivic_profissao.to_param}, valid_session
      assigns(:sivic_profissao).should eq(sivic_profissao)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SivicProfissao" do
        expect {
          post :create, {:sivic_profissao => valid_attributes}, valid_session
        }.to change(SivicProfissao, :count).by(1)
      end

      it "assigns a newly created sivic_profissao as @sivic_profissao" do
        post :create, {:sivic_profissao => valid_attributes}, valid_session
        assigns(:sivic_profissao).should be_a(SivicProfissao)
        assigns(:sivic_profissao).should be_persisted
      end

      it "redirects to the created sivic_profissao" do
        post :create, {:sivic_profissao => valid_attributes}, valid_session
        response.should redirect_to(SivicProfissao.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sivic_profissao as @sivic_profissao" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicProfissao.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_profissao => { "profissao" => "invalid value" }}, valid_session
        assigns(:sivic_profissao).should be_a_new(SivicProfissao)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicProfissao.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_profissao => { "profissao" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sivic_profissao" do
        sivic_profissao = SivicProfissao.create! valid_attributes
        # Assuming there are no other sivic_profissaos in the database, this
        # specifies that the SivicProfissao created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SivicProfissao.any_instance.should_receive(:update).with({ "profissao" => "MyString" })
        put :update, {:id => sivic_profissao.to_param, :sivic_profissao => { "profissao" => "MyString" }}, valid_session
      end

      it "assigns the requested sivic_profissao as @sivic_profissao" do
        sivic_profissao = SivicProfissao.create! valid_attributes
        put :update, {:id => sivic_profissao.to_param, :sivic_profissao => valid_attributes}, valid_session
        assigns(:sivic_profissao).should eq(sivic_profissao)
      end

      it "redirects to the sivic_profissao" do
        sivic_profissao = SivicProfissao.create! valid_attributes
        put :update, {:id => sivic_profissao.to_param, :sivic_profissao => valid_attributes}, valid_session
        response.should redirect_to(sivic_profissao)
      end
    end

    describe "with invalid params" do
      it "assigns the sivic_profissao as @sivic_profissao" do
        sivic_profissao = SivicProfissao.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicProfissao.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_profissao.to_param, :sivic_profissao => { "profissao" => "invalid value" }}, valid_session
        assigns(:sivic_profissao).should eq(sivic_profissao)
      end

      it "re-renders the 'edit' template" do
        sivic_profissao = SivicProfissao.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicProfissao.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_profissao.to_param, :sivic_profissao => { "profissao" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sivic_profissao" do
      sivic_profissao = SivicProfissao.create! valid_attributes
      expect {
        delete :destroy, {:id => sivic_profissao.to_param}, valid_session
      }.to change(SivicProfissao, :count).by(-1)
    end

    it "redirects to the sivic_profissaos list" do
      sivic_profissao = SivicProfissao.create! valid_attributes
      delete :destroy, {:id => sivic_profissao.to_param}, valid_session
      response.should redirect_to(sivic_profissaos_url)
    end
  end

end
