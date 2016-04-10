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
end
