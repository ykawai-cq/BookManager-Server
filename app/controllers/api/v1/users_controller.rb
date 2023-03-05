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

      def create
        user = User.new(user_params)
        if user.save
          render json: { status: '200', result: { id: user.id, email: user.email, token: user.password_digest } }
        else
          render json: { result: { message: '認証エラーです', description: 'リクエストをご確認ください' } }
        end
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
      wrap_parameters :user, include: [:email, :password, :password_confirmation]

    end
  end
end