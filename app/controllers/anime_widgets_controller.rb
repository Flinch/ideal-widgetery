class AnimeWidgetsController < ApplicationController
  before_action :set_anime_widget, only: [:show, :edit, :update, :destroy]

  # GET /anime_widgets
  # GET /anime_widgets.json
  def index
    @anime_widgets = AnimeWidget.all
  end

  # GET /anime_widgets/1
  # GET /anime_widgets/1.json
  def show
  end

  # GET /anime_widgets/new
  def new
    @anime_widget = AnimeWidget.new
  end

  # GET /anime_widgets/1/edit
  def edit
  end

  def get_anime_list
     @anime_widget = AnimeWidget.new(anime_widget_params)
     qry = Jikan::Query.new 
     a_name = qry.search(params[:anime_widget][:title], :anime)
     a_name.result
  end


  def results
    i=0
    num=3
    @anime_widget = [AnimeWidget.new, AnimeWidget.new, AnimeWidget.new]
    # qry = Jikan::Query.new 
    # a_name = qry.search("naruto", :anime)
    res = get_anime_list
     while (i<num)
         @anime_widget[i].title = res[i].title
         @anime_widget[i].description = res[i].synopsis
         @anime_widget[i].image = res[i].image
         @anime_widget[i].rating = res[i].rating
         i+=1
       end

  end


  # POST /anime_widgets
  # POST /anime_widgets.json
  def create
    @anime_widget = AnimeWidget.new(anime_widget_params)

    respond_to do |format|
      if @anime_widget.save
        format.html { redirect_to @anime_widget, notice: 'Anime widget was successfully created.' }
        format.json { render :show, status: :created, location: @anime_widget }
      else
        format.html { render :new }
        format.json { render json: @anime_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anime_widgets/1
  # PATCH/PUT /anime_widgets/1.json
  def update
    respond_to do |format|
      if @anime_widget.update(anime_widget_params)
        format.html { redirect_to @anime_widget, notice: 'Anime widget was successfully updated.' }
        format.json { render :show, status: :ok, location: @anime_widget }
      else
        format.html { render :edit }
        format.json { render json: @anime_widget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anime_widgets/1
  # DELETE /anime_widgets/1.json
  def destroy
    @anime_widget.destroy
    respond_to do |format|
      format.html { redirect_to anime_widgets_url, notice: 'Anime widget was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime_widget
      @anime_widget = AnimeWidget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anime_widget_params
      params.require(:anime_widget).permit(:title)
    end
end
