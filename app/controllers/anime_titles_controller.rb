class AnimeTitlesController < ApplicationController
  before_action :set_anime_title, only: %i[ show edit update destroy ]

  # GET /anime_titles or /anime_titles.json
  def index
    @anime_titles = AnimeTitle.all
  end

  # GET /anime_titles/1 or /anime_titles/1.json
  def show
  end

  # GET /anime_titles/new
  def new
    @anime_title = AnimeTitle.new
  end

  # GET /anime_titles/1/edit
  def edit
  end

  # POST /anime_titles or /anime_titles.json
  def create
    @anime_title = AnimeTitle.new(anime_title_params)

    respond_to do |format|
      if @anime_title.save
        format.html { redirect_to @anime_title, notice: "Anime title was successfully created." }
        format.json { render :show, status: :created, location: @anime_title }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @anime_title.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /anime_titles/1 or /anime_titles/1.json
  def update
    respond_to do |format|
      if @anime_title.update(anime_title_params)
        format.html { redirect_to @anime_title, notice: "Anime title was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @anime_title }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @anime_title.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /anime_titles/1 or /anime_titles/1.json
  def destroy
    @anime_title.destroy!

    respond_to do |format|
      format.html { redirect_to anime_titles_path, notice: "Anime title was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anime_title
      @anime_title = AnimeTitle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def anime_title_params
      params.require(:anime_title).permit(:name, :file, :ave_value, :theme_id)
    end
end
