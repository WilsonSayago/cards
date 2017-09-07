class CardsController < ApplicationController
  before_action :set_card, only: [:destroy]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.all
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new(card_params)
    month = params['month']
    date = params['date']
    @card.set_date(month,date['year'])
    respond_to do |format|
      if @card.save
        format.html { redirect_to cards_path, notice: 'Card was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/1
  # DELETE /cards/1.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to cards_url, notice: 'Card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:number, :cvv, :expirate_date)
    end
end
