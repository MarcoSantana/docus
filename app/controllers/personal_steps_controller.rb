class PersonalStepsController < ApplicationController
  include Wicked::Wizard
  steps :new, :image, :description

  def new
    session[:personal_document] = nil
    @personal_document = PersonalDocument.new
    session[:personal_document] = @personal_document.attributes
        next_step(@personal_document)
  end
  def show

    case step
      when :description
        @personal_document = PersonalDocument.new

      else
        @personal_document = PersonalDocument.new(session[:personal_document])
    end
    render_wizard
  end

  def update
    unless params[:personal_document].nil?
      session[:personal_document] = session[:personal_document].merge(params[:personal_document])
    else
      session[:personal_document] = params[:personal_document]
    end

    case step
      when :image
        @personal_document = PersonalDocument.new(personal_document_params)
        @personal_document.save
        session[:personal_document] = @personal_document
      when :description
        session[:personal_document] = session[:personal_document].merge(params[:personal_document])
        @personal_document.update_attributes(session[:personal_document])
        @personal_document.save
    end
    render_wizard
  end
    
  private
  def finish_wizard_path
    personal_document_path(@personal_document)
  end




  def personal_document_params
    params.fetch(:personal_document, {}).permit(:emission_date, :description, :image, :users_attributes => [current_user])
  end
end