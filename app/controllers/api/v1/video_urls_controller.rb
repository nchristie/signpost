# frozen_string_literal: true

module Api
  module V1
    class VideoUrlsController < BaseController
      before_action :set_video_url, only: %i[show update destroy]
      before_action :format_url, only: %i[create update]

      def index
        @video_urls = VideoUrl.all
        render json: @video_urls
      end

      def show
        render json: @video_url
      end

      def create
        @video_url = VideoUrl.new(video_url_params)
        if @video_url.save
          render json: @video_url, status: :created, location: api_v1_video_url_url(@video_url)
        else
          render json: @video_url.errors, status: :unprocessable_entity
        end
      end

      def update
        if @video_url.update(video_url_params)
          render json: @video_url
        else
          render json: @video_url.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @video_url.destroy
        head :no_content
      end

      private

      def set_video_url
        @video_url = VideoUrl.find(params[:id])
      end

      def video_url_params
        params.require(:video_url).permit(:url, :approved)
      end

      def format_url
        return unless params[:video_url][:url].include?('youtu.be')

        video_id = params[:video_url][:url].split('/').last
        params[:video_url][:url] = "https://www.youtube.com/embed/#{video_id}?start=#{params[:video_url][:start_time]}&end=#{params[:video_url][:end_time]}&autoplay=true"
      end

      def extract_video_id(url)
        # logic for extracting the video ID from the input URL
      end

      def generate_formatted_url(video_id)
        # logic for generating the formatted URL
      end

      def append_autoplay_parameter(url)
        # logic for appending the autoplay parameter to the formatted URL
      end

      def create_associated_records(video_url)
        written_term = WrittenTerm.create(name: video_url.url,
                                          written_language: WrittenLanguage.find_by(name: 'English'))
        url_term = UrlTerm.create(video_url:, written_term:)
        category = Category.find_or_create_by(name: params[:category_name])
        url_category = UrlCategory.create(video_url:, category:)
        Vote.create(url_term:, url_category:)
      end
    end
  end
end
