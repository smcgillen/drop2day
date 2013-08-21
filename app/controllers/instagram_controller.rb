class InstagramController < ApplicationController
  def index
    r = Instagram::get('smcgillen')
    render :json => r
  end



end


# CLIENT ID b83395640aec496fbe4eb7f340fde84a
# CLIENT SECRET a97872f648f546b78eca87518a162074