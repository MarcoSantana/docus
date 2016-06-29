class PersonalDocumentsController < ApplicationController
  before_action :set_personal_document, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :set_user


  # GET /documents
  # GET /documents.json
  def index
    #@personal_documents = PersonalDocument.all
    #Si cargo como admin tengo que hcer eager loading de usuarios con documentos
    #estoy busando el default sort en rensack
    if @user.administrador? || @user.moderador?
      @q = PersonalDocument.ransack(params[:q])
    else
      @q = @user.personal_documents.ransack(params[:q])
    end
    @personal_documents = @q.result(distinct: true).page(params[:page]).per(10)


  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    @personal_document = PersonalDocument.new
    unless @user.especialista? && params[:user_id]
      @personal_document.user_id = params[:user_id]
    else
      @personal_document.user = @user
    end
  end

  # GET /documents/1/edit
  def edit
  end

  # POST /documents
  # POST /documents.json
  def create
    @personal_document = PersonalDocument.new(personal_document_params)
    @personal_document.user_id= current_user.id


    respond_to do |format|
      if @personal_document.save
        format.html { redirect_to @personal_document, notice: 'Documento creado exitosamente' }
        UserMailer.create_document_mail(@user, @personal_document).deliver_now
        format.json { render :show, status: :created, location: @personal_document }
      else
        format.html { render :new }
        format.json { render json: @personal_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @personal_document.update(personal_document_params)
        format.html { redirect_to @personal_document, notice: 'Documento actulizado exitosamente.' }
        format.json { render :show, status: :ok, location: @personal_document }
      else
        format.html { render :edit }
        format.json { render json: @personal_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @personal_document.destroy
    respond_to do |format|
      format.html { redirect_to personal_documents_url, notice: 'Documento creado exitosamente.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_personal_document
    @personal_document = PersonalDocument.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def personal_document_params
    params.fetch(:personal_document, {}).permit(:certificate, :emission_date, :description, :image, :status, :comentary, :titles_attibutes => [:level], :users_attributes => [current_user])

  end
end
