class CepController < ApplicationController
respond_to :json

  def verificar
    cep = params[:cep]
    
    address = Correios::CEP::AddressFinder.get(cep)

    render :status => 200,
           	 :json => { :success => true,
                      :info => "Found",
                      :address => address,
                      :data => { :address => address,
                      
                                  }

                              }
    end

end
