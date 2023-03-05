module Api
  module V1
    class SessionsController < ApplicationController
      def new
      end
    
      def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          # sessionをセット
          session[:user_id] = user.id
          # ログインしたユーザー情報jsonを返す
          render json: { status: '200', result: { id: user.id, email: user.email, token: user.password_digest } }
        else
          # エラーのjsonを返す
          render json: { result: { message: '認証エラーです', description: 'リクエストをご確認ください' } }
        end
      end
    
      def destroy
      end
    end
  end
end