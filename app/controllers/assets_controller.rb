class AssetsController < ApplicationController

  skip_before_action: authorize_admin
  skip_before_action: authorize_manager, only: [:show, :index]

  def create
    new_asset = Asset.create!(asset_params)
    render json: new_asset, status: :created
  end

  def show
    asset = find_asset(params[:id])
    render json: asset, iclude: [:user]
  end

  def index
   render json: Asset.all, status: :ok
  end


  def destroy 
    asset = find_asset(params[:id])
    asset.destroy
    head: no_content
  end
  private

  def find_asset(id)
    Asset.find_by(id: id)
  end

  def asset_params
    params.permit(:name, :amount)
  end
end
