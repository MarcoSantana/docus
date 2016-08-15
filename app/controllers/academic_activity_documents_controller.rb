class AcademicActivityDocumentsController < ApplicationController
    before_action :set_academic_activity_document, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :set_user


    # GET /documents
    # GET /documents.json
    def index
      #@academic_activity_documents = AcademicActivityDocument.all
      #Si cargo como admin tengo que hcer eager loading de usuarios con documentos
      #estoy busando el default sort en rensack
      if @user.administrador? || @user.moderador?
        @q = AcademicActivityDocument.contemporary.ransack(params[:q])
      else
        @q = @user.academic_activity_documents.order(to: :desc).ransack(params[:q])
      end
      @academic_activity_documents = @q.result(distinct: true).page(params[:page]).per(10)


    end

    # GET /documents/1
    # GET /documents/1.json
    def show
    end

    # GET /documents/new
    def new
      @academic_activity_document = AcademicActivityDocument.new
      unless @user.especialista? && params[:user_id]
        @academic_activity_document.user_id = params[:user_id]
      else
        @academic_activity_document.user = @user
      end
    end

    # GET /documents/1/edit
    def edit
    end

    # POST /documents
    # POST /documents.json
    def create
      @academic_activity_document = AcademicActivityDocument.new(academic_activity_document_params)
      @academic_activity_document.user_id= current_user.id
      #@issuer = Issuer.find(params[:issuer][:id])
      #@academic_activity_document.issuers << @issuer


      respond_to do |format|
        if @academic_activity_document.save
          format.html { redirect_to @academic_activity_document, notice: 'Documento creado exitosamente' }
          UserMailer.create_document_mail(@user, @academic_activity_document).deliver_now
          format.json { render :show, status: :created, location: @academic_activity_document }
        else
          format.html { render :new }
          format.json { render json: @academic_activity_document.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /documents/1
    # PATCH/PUT /documents/1.json
    def update
      respond_to do |format|
        if @academic_activity_document.update(academic_activity_document_params)
          format.html { redirect_to @academic_activity_document, notice: 'Documento actulizado exitosamente.' }
          format.json { render :show, status: :ok, location: @academic_activity_document }
        else
          format.html { render :edit }
          format.json { render json: @academic_activity_document.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /documents/1
    # DELETE /documents/1.json
    def destroy
      @academic_activity_document.destroy
      respond_to do |format|
        format.html { redirect_to academic_activity_documents_url, danger: 'Documento destruido exitosamente.' }
        format.json { head :no_content }
      end
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_academic_activity_document
      @academic_activity_document = AcademicActivityDocument.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def academic_activity_document_params
      params.fetch(:academic_activity_document, {}).permit(:certificate, :emission_date, :description, :image, :status, :comentary, :from, :to, :issuers_attibutes => [:id], :users_attributes => [current_user])

    end

end
