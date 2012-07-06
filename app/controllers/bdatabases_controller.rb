class BdatabasesController < ApplicationController
  # GET /bdatabases
  # GET /bdatabases.json
  def index
    @bdatabases = Bdatabase.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bdatabases }
    end
  end

  # GET /bdatabases/1
  # GET /bdatabases/1.json
  def show
    @bdatabase = Bdatabase.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bdatabase }
    end
  end

  # GET /bdatabases/new
  # GET /bdatabases/new.json
  def new
    @bdatabase = Bdatabase.new
	@bdatabase.msg = params[:msg]
	@bdatabase.mtype = params[:mtype]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bdatabase }
    end
  end

  # GET /bdatabases/1/edit
  def edit
    @bdatabase = Bdatabase.find(params[:id])
  end

  # POST /bdatabases
  # POST /bdatabases.json
  def create
    @bdatabase = Bdatabase.new(params[:bdatabase])

    respond_to do |format|
      if @bdatabase.save
        format.html { redirect_to @bdatabase, notice: 'Bdatabase was successfully created.' }
        format.json { render json: @bdatabase, status: :created, location: @bdatabase }
      else
        format.html { render action: "new" }
        format.json { render json: @bdatabase.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bdatabases/1
  # PUT /bdatabases/1.json
  def update
    @bdatabase = Bdatabase.find(params[:id])

    respond_to do |format|
      if @bdatabase.update_attributes(params[:bdatabase])
        format.html { redirect_to @bdatabase, notice: 'Bdatabase was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bdatabase.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bdatabases/1
  # DELETE /bdatabases/1.json
  def destroy
    @bdatabase = Bdatabase.find(params[:id])
    @bdatabase.destroy

    respond_to do |format|
      format.html { redirect_to bdatabases_url }
      format.json { head :no_content }
    end
  end
end
