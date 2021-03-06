module Api
  module V1
    class TrainersController < ApplicationController
      acts_as_token_authentication_handler_for User, fallback: :exception

      def index
        @trainers = locations.collect(&:trainer).uniq
        render json: @trainers
      end
      
      protected

      def locations
        Location.near([params[:lat],params[:lon]],5)
      end

    end
  end
end
