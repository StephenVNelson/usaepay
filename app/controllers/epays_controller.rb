class EpaysController < ApplicationController
  def index
    @epays = HTTParty.get('https://sandbox.usaepay.com/api/v2/transactions',
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Basic #{Rails.application.credentials.usaepay[:authkey]}"
      }
    )
  end

  def new

  end

  def create
    json_params = epay_params.to_json
    @epay = HTTParty.post('https://sandbox.usaepay.com/api/v2/transactions',
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Basic #{Rails.application.credentials.usaepay[:authkey]}"
      },
      body: json_params
    )
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
