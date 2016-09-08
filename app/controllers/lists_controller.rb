class ListsController < ApplicationController

  def create
    @list = List.new list_params
    if @list.save
      render :status => 200,
        :json => { :success => true,
                  :info => "created",
                  :list => @list
        } 
    else
      render :status => 501,
        :json => { :success => false,
                  :info => "create fail",
        }
    end  
  end

  def update
    @list = List.update params[:id], list_params
    if @list.save
      render :status => 200,
        :json => { :success => true,
                  :info => "edited",
                  :list => @list
       } 
    else
      render :status => 501,
        :json => { :success => false,
                  :info => "edit fail",
        }
    end 
  end

  def destroy
    @list = List.find params[:id]
    if @list.destroy
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

  def getNestedData
    results = {}
    @lists = List.all
    @cards = Card.all
    results = @lists.map do |l|
      {
        id: l.id,
        name: l.name,
        cards: 
          @cards.where(:list_id => l.id).map do |c| 
            {
              id: c.id,
              name: c.name,
              list_id: c.list_id
            }
          end
      } 
    end
    render :status => 200,
      :json => {
        results: results
      }
  end

  def index
    @lists = List.all
    render :status => 200,
        :json => { 
          :lists=> @lists
        } 
  end

  private
    def list_params
      params.require(:list).permit(:name)
    end
end
