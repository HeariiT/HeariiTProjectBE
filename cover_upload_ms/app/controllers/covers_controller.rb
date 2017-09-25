class CoversController < ApplicationController
  before_action :set_cover, only: [:show, :update, :destroy]

  # GET /covers
  def index
    @covers = Cover.all

    render json: @covers
  end

  # GET /covers/1
  def show
    render json: @cover
  end

  # POST /covers
  def create
    @cover = Cover.new(cover_params)

    if @cover.save
      render json: @cover, status: :created, location: @cover
    else
      render json: @cover.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /covers/1
  def update
    if @cover.update(cover_params)
      render json: @cover
    else
      render json: @cover.errors, status: :unprocessable_entity
    end
  end

  # DELETE /covers/1
  def destroy

    unless is_number?(params[:id])
      render json: 
      {
        message: "Not Acceptable (Invalid Params)",
        code: 406,
        description: "Cover id must be of type: integer"
      }, status: 406
      return
    end

    unless @cover.nil?
      if @cover.destroy
        render json:
        {
          message: "Ok",
          code: 200,
          description: "Successfully deleted cover"
        }, status: 200
        return
      end
    else
      render json:
      {
        message: "Not Found",
        code: 404,
        description: "Cover with id=#{params[:id]} was not found!"
      }, status: 404
      return
    end


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cover
      @cover = Cover.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cover_params
      params.require(:cover).permit(:picture)
    end

    def is_number? string
      true if Integer(string) rescue false
    end


end
