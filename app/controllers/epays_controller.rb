class EpaysController < ApplicationController
  def index
    @epays = HTTParty.get('https://sandbox.usaepay.com/api/v2/transactions',
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Basic #{Rails.application.credentials.usaepay[:authkey]}"
      }
    )
  end

  def select

  end

  def cart
    @total = params[:bicycle].to_i + params[:car].to_i + params[:plane].to_i
  end

  def new
  end

  def create
    json_params = epay_params.to_json
    epay = @epay = HTTParty.post('https://sandbox.usaepay.com/api/v2/transactions',
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Basic #{Rails.application.credentials.usaepay[:authkey]}"
      },
      body: json_params
    )
    if epay['result'] == 'Error'
      flash[:danger] = epay['error']
      redirect_to select_path
    else
      flash[:success] = 'You have successfully made your purchase'
      redirect_to epays_path
    end
  end

  private

  def epay_params
    params.require(:epay).permit(
      :command,
      :amount,
      :invoice,
      creditcard: [
        :cardholder,
        :number,
        :expiration,
        :cvc,
        :avs_street,
        :avs_zip,
      ]
    )
  end
end
