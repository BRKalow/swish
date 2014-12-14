class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new]

  respond_to :html

  def index
    @collections = Collection.paginate(page: params[:page], per_page: 10)
    respond_with(@collections)
  end

  def show
    respond_with(@collection)
  end

  def new
    @collection = Collection.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def edit
  end

  def create
    @collection = Collection.new(collection_params)
    if @collection.save
      respond_to do |format|
        format.html do
          redirect_to @collection, notice: 'Collection created.'
        end
        format.js do
          @collections = current_user.collections
        end
      end
    else
      render :new
    end
  end

  def update
    @collection.update(collection_params)
    respond_with(@collection)
  end

  def destroy
    @collection.destroy
    respond_with(@collection)
  end

  private

  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :user_id, :num_snippets,
                                       :num_favorites, :tag_list)
  end
end
