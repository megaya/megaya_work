class Api::V1::SessionController < ApiController
  def log_in
    account = Account.find_for_database_authentication(email: account_param[:email])

    return render json: {result: false} if account.nil?

    if account.valid_password?(account_param[:password])
      sign_in :account, account
      render json: {state: true}
    else
      render json: {state: false}
    end
  end

  def log_out
    sign_out current_account
    render json: {state: true}
  end

  private
  def account_param
    params.require(:account).permit(:email, :password)
  end
end