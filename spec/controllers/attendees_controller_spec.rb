require 'rails_helper'

RSpec.describe AttendeesController, type: :controller do
  render_views

  describe 'GET #new' do
    before { get :new }

    it 'return OK' do
      expect(response).to be_ok
      expect(response.body).to include('Assando Eventos')
    end
  end

  describe 'POST #create' do
    context 'with valid data' do
      let(:params) do
        { "name" => "Fulano",
          "cpf"  => "12313212",
          "email" => "contato@fulano.com",
          "phone" => "111111111" }
      end

      it 'create a new attendee' do
        expect do
          post :create, attendee: params
        end.to change(Attendee, :count).from(0).to(1)

        attendee = Attendee.last
        expect(attendee.name).to eq("Fulano")
        expect(attendee.cpf).to eq("12313212")
        expect(attendee.email).to eq("contato@fulano.com")
        expect(attendee.phone).to eq("111111111")
      end

      it 'redirect to root path' do
        post :create, attendee: params
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid data' do
      let(:params) do
        { "name" => "Fulano",
          "cpf"  => "12313212",
          "email" => "" }
      end

      it 'do not create a new attendee' do
        expect do
          post :create, attendee: params
        end.to_not change(Attendee, :count).from(0)
      end

      it 'render form' do
        post :create, attendee: params
        expect(response).to render_template(:new)
        expect(response.body).to include('Assando Eventos')
      end
    end
  end
end
