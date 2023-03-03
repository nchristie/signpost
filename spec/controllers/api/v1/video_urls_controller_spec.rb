# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::VideoUrlsController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      let(:url) { 'https://youtu.be/08SRACZLwpY?t=80' }
      let(:category) { create(:category) }
      let(:written_language) { create(:written_language) }
      let(:written_term) { create(:written_term, written_language:) }
      let(:url_category_params) { { category_id: category.id } }
      let(:url_term_params) { { written_term_id: written_term.id } }
      let(:params) do
        { video_url: { url:, approved: true, url_categories_attributes: [url_category_params],
                       url_terms_attributes: [url_term_params] } }
      end

        it 'creates a new VideoUrl, UrlCategory, UrlTerm, WrittenTerm, WrittenLanguage, and Vote' do
          expect do
            post :create, params:
          end.to change(VideoUrl, :count).by(1)
                                         .and change(UrlCategory, :count).by(1)
                                                                         .and change(UrlTerm, :count).by(1)
                                                                                                     .and change(
                                                                                                       WrittenTerm, :count
                                                                                                     ).by(1)
            .and change(
              WrittenLanguage, :count
            ).by(1)
            .and change(
              Vote, :count
            ).by(1)

          expect(response).to have_http_status(:created)
          expect(JSON.parse(response.body)['url']).to eq('https://www.youtube.com/embed/08SRACZLwpY?start=80&end=90&autoplay=true')
        end
    end

    context 'with invalid params' do
      let(:url) { 'invalid-url' }
      let(:params) { { video_url: { url: } } }

      it 'does not create a new VideoUrl and returns unprocessable entity status with errors' do
        expect do
          post :create, params:
        end.to_not change(VideoUrl, :count)

        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)).to include('errors')
      end
    end
  end
end
