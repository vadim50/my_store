class ItemsController < ApplicationController

  before_filter :find_item, only: [:show, :edit, :destroy, :update, :upvote]
  before_filter :check_if_admin, only: [:edit, :update, :new,
                                        :create, :destroy]

  def index
    @items = Item.all
    
  end

  def expensive
    @items = Item.where("price > 1000")
    render "index"
  end

  def show # GET /items/1
    unless @item
      render text: "Page not found",
      status: 404
    end
  end

  def new  # GET /items/new
    @item = Item.new
  end

  def edit # GET /items/1/edit
    
  end

  def create # POST /items
   @item = Item.new(items_params)

      if @item.save

        @item.save
        redirect_to @item

      else

        render action: 'new'

      end
  end

  def update # PUT /items/1

     @item.update_attributes(items_params)

      if @item.errors.empty?

        redirect_to item_path(@item)

      else

        render action: 'edit'

      end

  end

  def destroy # DELETE /items/1
    @item.destroy
    redirect_to action: "index"

  end

  def upvote
    @item.increment!(:votes_count)
    redirect_to action: :index
  end

  private

    def find_item
      @item = Item.where(id: params[:id]).first
      render_404 unless @item
    end

    def items_params
      params.require(:item).permit(:price, :name, :real, :weight, :description)
    end


end
