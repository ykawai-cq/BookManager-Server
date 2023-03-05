module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show]

      def index
        users = User.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded users', data: users }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the user', data: @user }
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

    end
  end
end