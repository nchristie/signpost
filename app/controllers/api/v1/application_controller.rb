# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :allow_cors

      def allow_cors
        response.headers['Access-Control-Allow-Origin'] = '*'
        response.headers['Access-Control-Allow-Methods'] = 'GET'
        response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
        response.headers['Access-Control-Max-Age'] = '1728000'
      end
    end
  end
end
