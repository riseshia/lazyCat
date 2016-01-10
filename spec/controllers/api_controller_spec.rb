require 'rails_helper'

RSpec.describe ApiController, type: :controller do
  describe 'POST #index' do
    let(:valid_payload) do
      {
        token: "65a8f249a606569ea81c2d2d41a24f59c3016698484cbb294edcf6eeb9196016",
        status: "ok",
        message: "Job is done"
      }
    end

    let(:no_status_payload) do
      {
        token: "65a8f249a606569ea81c2d2d41a24f59c3016698484cbb294edcf6eeb9196016",
        # status: "fail",
        message: "Job is done"
      }
    end

    let(:no_message_payload) do
      {
        token: "65a8f249a606569ea81c2d2d41a24f59c3016698484cbb294edcf6eeb9196016",
        status: "ok"
        # message: "No Message"
      }
    end

    context 'Token not exists' do
      it 'returns http success' do
        post :index, {}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'Token exists' do
      before(:example) do
        task = create(:task)
        task.token = '65a8f249a606569ea81c2d2d41a24f59c3016698484cbb294edcf6eeb9196016'
        task.save
      end

      it 'returns http success if token exists' do
        post :index, valid_payload
        expect(response).to have_http_status(:success)
      end

      it 'create log status is fail if status is not in payload' do
        post :index, no_status_payload
        json = JSON.parse(response.body)
        expect(json['status']).to eq('fail')
        expect(json['message']).to eq('Job is done')
      end

      it 'create log messge is \'No Message\' if message is not in payload' do
        post :index, no_message_payload
        json = JSON.parse(response.body)
        expect(json['status']).to eq('ok')
        expect(json['message']).to eq('No Message')
      end
    end
  end
end
