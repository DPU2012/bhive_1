class MsgsController < ApplicationController
  # GET /msgs
  # GET /msgs.json
  def index
    @msgs = Msg.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @msgs }
    end
  end

  # GET /msgs/1
  # GET /msgs/1.json
  def show
    @msg = Msg.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @msg }
    end
  end

  # GET /msgs/new
  # GET /msgs/new.json
  def new
    @msg = Msg.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @msg }
    end
  end

  # GET /msgs/1/edit
  def edit
    @msg = Msg.find(params[:id])
  end

  # POST /msgs
  # POST /msgs.json
  def create
    @msg = Msg.new(params[:msg])

    respond_to do |format|
      if @msg.save
        format.html { redirect_to @msg, notice: 'Msg was successfully created.' }
        format.json { render json: @msg, status: :created, location: @msg }
      else
        format.html { render action: "new" }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /msgs/1
  # PUT /msgs/1.json
  def update
    @msg = Msg.find(params[:id])

    respond_to do |format|
      if @msg.update_attributes(params[:msg])
        format.html { redirect_to @msg, notice: 'Msg was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @msg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /msgs/1
  # DELETE /msgs/1.json
  def destroy
    @msg = Msg.find(params[:id])
    @msg.destroy

    respond_to do |format|
      format.html { redirect_to msgs_url }
      format.json { head :no_content }
    end
  end
end
