require 'rails_helper'

RSpec.describe TalksController, type: :controller do
  render_views

  describe 'GET #index' do
    before do
      Talk.create!(title: "Primeira Palestra", description: "descricao", start: "10:00:00", finish: "11:00:00")
      Talk.create!(title: "Abertura", description: "descricao", start: "09:00:00", finish: "10:00:00")
      get :index
    end

    it 'return OK' do
      expect(response).to be_ok
      expect(response.body).to include('Assando Eventos')
    end

    it 'include list of talks' do
      talks = assigns(:talks)

      expect(talks.count).to eq(2)
      expect(talks.first.title).to eq("Abertura")
      expect(talks.second.title).to eq("Primeira Palestra")
    end
  end

  describe 'GET #show' do
    let(:talk) { Talk.create!(title: "Primeira Palestra", description: "descricao", start: "10:00:00", finish: "11:00:00") }

    before { get :show, id: talk.slug }

    it 'return OK' do
      expect(response).to be_ok
      expect(response.body).to include('Assando Eventos')
    end

    it 'include talk details' do
      expect(assigns(:talk)).to eq(talk)

      expect(response.body).to include(talk.title)
      expect(response.body).to include(talk.description)
      expect(response.body).to include('10h00')
      expect(response.body).to include('11h00')
    end
  end
end
