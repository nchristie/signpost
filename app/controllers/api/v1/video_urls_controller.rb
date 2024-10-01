# frozen_string_literal: true

module Api
  module V1
    class VideoUrlsController < BaseController
      before_action :set_video_url, only: %i[show update destroy]

      def index
        @video_urls = VideoUrl.page(params[:page]).per(params[:per_page] || 5)
        render json: {
          video_urls: @video_urls,
          meta: {
            total_pages: @video_urls.total_pages,
            current_page: @video_urls.current_page,
            next_page: @video_urls.next_page,
            prev_page: @video_urls.prev_page
          }
        }
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

      def find_urls
        written_language_name = params[:written_language]
        written_term_name = params[:written_term].downcase
        category = params[:category]
        written_term = WrittenTerm.find_by(name: written_term_name)

        if written_term
          video_urls = VideoUrl.joins(url_term: { written_term: :written_language }, url_category: :category)
                               .where(written_terms: { name: written_term_name })
                               .where(categories: { name: category })
                               .where(written_languages: { name: written_language_name })
                               .pluck(:url)
          if video_urls.any?
            render json: { urls: video_urls }
          else
            render json: { error: "No video URLs found for written term #{written_term_name} and category #{category}" },
                   status: :not_found
          end
        else
          render json: { error: "Written term #{written_term_name} not found" }, status: :not_found
        end
      end

      private

      def set_video_url
        @video_url = VideoUrl.find(params[:id])
      end

      def video_url_params
        params.require(:video_url).permit(:url, :approved)
      end
    end
  end
end
