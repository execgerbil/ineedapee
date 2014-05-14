require 'spec_helper'


describe WashroomsController do

  let!(:user) { create(:user) }
  let!(:washroom) { create(:washroom, user: user) }

  context "with user signed in" do
  before { sign_in user }

  describe "#index" do
    it "finds all the washrooms in the database" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "#new" do

    it "renders the form to enter a new washroom listing" do
      get :new
      expect(response).to render_template(:new)
    end
 
  end

  describe "#create" do

  end

  describe "#show" do

  end

  describe "#update" do
  
  end

  describe "#destroy" do
     it "deletes the washroom listing" do
            expect do
        delete :destroy, id: washroom.id
      end.to change { Washroom.count }.by(-1)
    end

  end

end
  
end
