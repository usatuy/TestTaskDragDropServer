class CardsController < ApplicationController

  def create
    @card = Card.new card_params
    if @card.save
      render :status => 200,
        :json => { :success => true,
                  :info => "created",
                  :card => @card
        } 
    else
      render :status => 501,
        :json => { :success => false,
                  :info => "create fail",
        }
    end  
  end

        def update
    @card = Card.update params[:id], card_params
    if @card.save
      render :status => 200,
        :json => { :success => true,
                  :info => "edited",
                  :card => @card
        } 
    else
        render :status => 501,
        :json => { :success => false,
                  :info => "edit fail",
        }
    end 
  end

  def destroy
    @card = Card.find params[:id]
    if @card.destroy
        render :status => 200,
        :json => { :success => true,
                  :info => "deleted",
        } 
    else
        render :status => 501,
        :json => { :success => false,
                  :info => "delete fail",
        }
    end 
  end

  def index
    @cards = Card.all
    render :status => 200,
        :json => { 
          :cards=> @cards
        } 
  end 

  private
    def card_params
      params.require(:card).permit(:name, :list_id)
    end
end
