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
    @epay = Epay.new
  end

  def new
  end

  def create
    @total = epay_params[:amount]
    @epay = Epay.new(epay_params)
    json_params = epay_params.to_json
    json_params["creditcard_attributes"] = "creditcard"
    epay = HTTParty.post('https://sandbox.usaepay.com/api/v2/transactions',
      headers: {
        'Content-Type' => 'application/json',
        'Authorization' => "Basic #{Rails.application.credentials.usaepay[:authkey]}"
      },
      body: json_params
    )
    respond_to do |format|
      if @epay.valid? && epay['result'] != 'Error'
        @epay.save
        flash[:success] = 'You have successfully made your purchase'
        format.html {redirect_to epays_path}
      elsif epay['result'] == 'Error'
        flash[:danger] = epay['error']
        format.html {render 'cart'}
      else
        format.html {render 'cart'}
      end
    end
  end

  private

  def epay_params
    params.require(:epay).permit(
      :command,
      :amount,
      :invoice,
      creditcard_attributes: [
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
