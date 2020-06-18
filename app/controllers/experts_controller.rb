class ExpertsController < ApplicationController
  before_action :set_expert, only: [:show, :edit, :update, :destroy]

  # Needed for nokogiri.
  require 'open-uri'

  # GET /experts
  # GET /experts.json
  def index
    @experts = Expert.all
  end

  # GET /experts/1
  # GET /experts/1.json
  def show
    @tags = @expert.tags.all
  end

  # GET /experts/new
  def new
    @expert = Expert.new
  end

  # GET /experts/1/edit
  def edit
  end

  # POST /experts
  # POST /experts.json
  def create
    @expert = Expert.new(expert_params)

    respond_to do |format|
      if @expert.save
        format.html { redirect_to @expert, notice: 'Expert was successfully created.' }
        format.json { render :show, status: :created, location: @expert }
        set_heading_tags(@expert.url) # Must be called after save.
        Shortener::ShortenedUrl.generate(@expert.url) # Called during create but after save.
      else
        format.html { render :new }
        format.json { render json: @expert.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experts/1
  # PATCH/PUT /experts/1.json
  def update
    respond_to do |format|
      if @expert.update(expert_params)
        format.html { redirect_to @expert, notice: 'Expert was successfully updated.' }
        format.json { render :show, status: :ok, location: @expert }
      else
        format.html { render :edit }
        format.json { render json: @expert.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experts/1
  # DELETE /experts/1.json
  def destroy
    @expert.destroy
    respond_to do |format|
      format.html { redirect_to experts_url, notice: 'Expert was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Get all of the heading tags from the provided URL. Save them to the tags table.
  def set_heading_tags(url)

    html = URI.open(url)
    parsed_data = Nokogiri::HTML.parse(html)

    heading_one_tags = parsed_data.xpath("//h1")
    heading_one_tags.each do |tag|
      @expert.tags.create(tag: "h1", url: "#{tag.text}")
    end

    heading_two_tags = parsed_data.xpath("//h2")
    heading_two_tags.each do |tag|
      @expert.tags.create(tag: "h2", url: "#{tag.text}")
    end

    heading_three_tags = parsed_data.xpath("//h3")
    heading_three_tags.each do |tag|
      @expert.tags.create(tag: "h3", url: "#{tag.text}")
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expert
      @expert = Expert.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expert_params
      params.require(:expert).permit(:name, :url)
    end
end
