require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  render_views

  describe 'GET #home' do
    before { get :home }

    it 'return OK' do
      expect(response).to be_ok
      expect(response.body).to include('Assando Eventos')
    end

    it 'includes today date as @date' do
      expect(assigns(:date)).to be_a(Date)
      expect(assigns(:date)).to eq(Date.today)
    end

    it 'include list of talks'
  end
end
