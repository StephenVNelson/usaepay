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
    params = params[:transactions]
    # @epay = HTTParty.post('https://sandbox.usaepay.com/api/v2/transactions',
    #   headers: {
    #     'Content-Type' => 'application/json',
    #     'Authorization' => "Basic #{Rails.application.credentials.usaepay[:authkey]}"
    #   },
    #   body: {}
    # )
  end
end
