module Api
  module V1
    class UsersController < ApplicationController
      acts_as_token_authentication_handler_for User, fallback: :none, :except=>[:create,:show]
      protect_from_forgery :except => [:create, :show]

      def create
        @user = User.new registration_params
        if @user.valid?
          @user.save!
          render json: {id: @user.id, user_token: @user.authentication_token}
        else
          render json: {errors: @user.errors.full_messages}
        end

      end

      def show
        @user = User.find params[:id]
        head 500 and return unless @user && @user.valid_password?(params[:password])
        render json: {id: @user.id, user_token: @user.authentication_token}
      end

      def registration_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
  end
end
