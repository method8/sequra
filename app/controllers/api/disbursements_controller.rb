module Api
    class DisbursementsController < ApplicationController

      # At the index, do not accept zero parameters
      # but if only a date is specified, display all merchants disbursed in
      # that week

      def index
        if params[:created_at].nil?
          render json: {status: 'ERROR', message: 'Missing required parameter [created_at]'}, status: :bad_request
        elsif params[:merchant_id].nil?
          disbursements = Disbursement.where('date(created_at) = ?', params[:created_at]);
          render json: {status: 'SUCCESS', message: 'Disbursements for all merchants week starting [' + params[:created_at] + ']', data:disbursements}, status: :ok
        else
          disbursements = Disbursement.where('merchant_id = ? and date(created_at) = ?', params[:merchant_id], params[:created_at]);
          render json: {status: 'SUCCESS', message: 'Disbursements for merchant [' + params[:merchant_id] + '] week [' + params[:created_at] + ']', data:disbursements}, status: :ok
        end
      end
    end
end
