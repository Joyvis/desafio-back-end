# frozen_string_literal: true

class TransactionsController < ApplicationController
  def index
    @transactions = []
    if params[:q].present?
      @transactions = Transaction
        .ransack(params[:q])
        .result
        .includes(:customer, :transaction_type)
    end
    @customers = Customer.all
    render :index
  end

  def import
    transaction = CnabRules::DataImporter.import(transaction_params[:file_data])

    redirect_to action: :index
  end

  private

  def transaction_params
    params.require(:transaction).permit(:file_data)
  end
end
