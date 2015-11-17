module Api
  module V1
    class TrainersController < ApplicationController
      acts_as_token_authentication_handler_for User, fallback: :exception

      def index
        @trainers = Trainer.all
        render json: @trainers
      end

    end
  end
end
