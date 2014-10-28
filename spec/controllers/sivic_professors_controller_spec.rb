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

describe SivicProfessorsController do

  # This should return the minimal set of attributes required to create a valid
  # SivicProfessor. As you add validations to SivicProfessor, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "sivic_pessoa" => "" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # SivicProfessorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all sivic_professors as @sivic_professors" do
      sivic_professor = SivicProfessor.create! valid_attributes
      get :index, {}, valid_session
      assigns(:sivic_professors).should eq([sivic_professor])
    end
  end

  describe "GET show" do
    it "assigns the requested sivic_professor as @sivic_professor" do
      sivic_professor = SivicProfessor.create! valid_attributes
      get :show, {:id => sivic_professor.to_param}, valid_session
      assigns(:sivic_professor).should eq(sivic_professor)
    end
  end

  describe "GET new" do
    it "assigns a new sivic_professor as @sivic_professor" do
      get :new, {}, valid_session
      assigns(:sivic_professor).should be_a_new(SivicProfessor)
    end
  end

  describe "GET edit" do
    it "assigns the requested sivic_professor as @sivic_professor" do
      sivic_professor = SivicProfessor.create! valid_attributes
      get :edit, {:id => sivic_professor.to_param}, valid_session
      assigns(:sivic_professor).should eq(sivic_professor)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new SivicProfessor" do
        expect {
          post :create, {:sivic_professor => valid_attributes}, valid_session
        }.to change(SivicProfessor, :count).by(1)
      end

      it "assigns a newly created sivic_professor as @sivic_professor" do
        post :create, {:sivic_professor => valid_attributes}, valid_session
        assigns(:sivic_professor).should be_a(SivicProfessor)
        assigns(:sivic_professor).should be_persisted
      end

      it "redirects to the created sivic_professor" do
        post :create, {:sivic_professor => valid_attributes}, valid_session
        response.should redirect_to(SivicProfessor.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved sivic_professor as @sivic_professor" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicProfessor.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_professor => { "sivic_pessoa" => "invalid value" }}, valid_session
        assigns(:sivic_professor).should be_a_new(SivicProfessor)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        SivicProfessor.any_instance.stub(:save).and_return(false)
        post :create, {:sivic_professor => { "sivic_pessoa" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested sivic_professor" do
        sivic_professor = SivicProfessor.create! valid_attributes
        # Assuming there are no other sivic_professors in the database, this
        # specifies that the SivicProfessor created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        SivicProfessor.any_instance.should_receive(:update).with({ "sivic_pessoa" => "" })
        put :update, {:id => sivic_professor.to_param, :sivic_professor => { "sivic_pessoa" => "" }}, valid_session
      end

      it "assigns the requested sivic_professor as @sivic_professor" do
        sivic_professor = SivicProfessor.create! valid_attributes
        put :update, {:id => sivic_professor.to_param, :sivic_professor => valid_attributes}, valid_session
        assigns(:sivic_professor).should eq(sivic_professor)
      end

      it "redirects to the sivic_professor" do
        sivic_professor = SivicProfessor.create! valid_attributes
        put :update, {:id => sivic_professor.to_param, :sivic_professor => valid_attributes}, valid_session
        response.should redirect_to(sivic_professor)
      end
    end

    describe "with invalid params" do
      it "assigns the sivic_professor as @sivic_professor" do
        sivic_professor = SivicProfessor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicProfessor.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_professor.to_param, :sivic_professor => { "sivic_pessoa" => "invalid value" }}, valid_session
        assigns(:sivic_professor).should eq(sivic_professor)
      end

      it "re-renders the 'edit' template" do
        sivic_professor = SivicProfessor.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        SivicProfessor.any_instance.stub(:save).and_return(false)
        put :update, {:id => sivic_professor.to_param, :sivic_professor => { "sivic_pessoa" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested sivic_professor" do
      sivic_professor = SivicProfessor.create! valid_attributes
      expect {
        delete :destroy, {:id => sivic_professor.to_param}, valid_session
      }.to change(SivicProfessor, :count).by(-1)
    end

    it "redirects to the sivic_professors list" do
      sivic_professor = SivicProfessor.create! valid_attributes
      delete :destroy, {:id => sivic_professor.to_param}, valid_session
      response.should redirect_to(sivic_professors_url)
    end
  end

end
