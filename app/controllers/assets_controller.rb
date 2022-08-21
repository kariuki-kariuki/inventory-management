class AssetsController < ApplicationController

  skip_before_action: authorize_admin

  def create
    new_asset = Asset.create!(asset_params)
    render json: new_asset, status: :created
  end

  private

  def asset_params
    params.permit(:name, :amount)
  end
end
