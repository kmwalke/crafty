class VisionBoardController < ApplicationControlle
  respond_to do |format|
    format.html { redirect_to listings_path, notice: 'Listing was successfully destroyed.', status: :see_other }
    format.json { head :no_content }
  end
  r
  def index; end
end
