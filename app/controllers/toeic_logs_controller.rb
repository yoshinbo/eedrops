class ToeicLogsController < ApplicationController
  before_filter :has_logined
  # GET /toeic_logs
  # GET /toeic_logs.json
  def index
    @user = current_user;
    @toeic_logs = ToeicLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @toeic_logs }
    end
  end

  # GET /toeic_logs/1
  # GET /toeic_logs/1.json
  def show
    @user = current_user;
    @toeic_log = ToeicLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @toeic_log }
    end
  end

  # GET /toeic_logs/new
  # GET /toeic_logs/new.json
  def new
    @user = current_user;
    @toeic_log = ToeicLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @toeic_log }
    end
  end

  # GET /toeic_logs/1/edit
  def edit
    @user = current_user;
    @toeic_log = ToeicLog.find(params[:id])
  end

  # POST /toeic_logs
  # POST /toeic_logs.json
  def create
    @user = current_user;
    @toeic_log = ToeicLog.new(params[:toeic_log])

    respond_to do |format|
      if @toeic_log.save
        format.html { redirect_to @toeic_log, notice: 'Toeic log was successfully created.' }
        format.json { render json: @toeic_log, status: :created, location: @toeic_log }
      else
        format.html { render action: "new" }
        format.json { render json: @toeic_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /toeic_logs/1
  # PUT /toeic_logs/1.json
  def update
    @user = current_user;
    @toeic_log = ToeicLog.find(params[:id])

    respond_to do |format|
      if @toeic_log.update_attributes(params[:toeic_log])
        format.html { redirect_to @toeic_log, notice: 'Toeic log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @toeic_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /toeic_logs/1
  # DELETE /toeic_logs/1.json
  def destroy
    @user = current_user;
    @toeic_log = ToeicLog.find(params[:id])
    @toeic_log.destroy

    respond_to do |format|
      format.html { redirect_to toeic_logs_url }
      format.json { head :no_content }
    end
  end
end
