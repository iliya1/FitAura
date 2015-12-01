module Api
  module V1
    class TrainerClassesController < ApplicationController
      acts_as_token_authentication_handler_for User, fallback: :exception

      def index
        @trainer_classes = TrainerClass.where("location_id in (?)", self.locations.collect(&:id))
        render json: @trainer_classes
      end
      
      protected

      def locations
        Location.near([params[:lat],params[:lon]],5)
      end

    end
  end
end
