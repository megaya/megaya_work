class Api::V1::AccountsController < ApiController
  before_action :account_login

  def show
    render json: {email: current_account[:email]}
  end

  private

  def account_login
    # ログインしていない場合空のjsonを返す
    # リダイレクトさせたいわけではないので authenticate_account! は使わないことにした
    return render json: {} unless account_signed_in?
  end
end