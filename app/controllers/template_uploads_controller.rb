class TemplateUploadsController < ApplicationController
  before_action :set_template_upload, only: [:show, :edit, :update, :destroy]

  # GET /template_uploads
  def index
    @template_uploads = TemplateUpload.all
  end

  # GET /template_uploads/1
  def show
  end

  # GET /template_uploads/new
  def new
    @template_upload = TemplateUpload.new
  end

  # GET /template_uploads/1/edit
  def edit
  end

  # POST /template_uploads
  def create
    @template_upload = TemplateUpload.new(template_upload_params)

    if @template_upload.save
      redirect_to @template_upload, notice: 'Template upload was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /template_uploads/1
  def update
    if @template_upload.update(template_upload_params)
      redirect_to @template_upload, notice: 'Template upload was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /template_uploads/1
  def destroy
    @template_upload.destroy
    redirect_to template_uploads_url, notice: 'Template upload was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_template_upload
      @template_upload = TemplateUpload.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def template_upload_params
      params.require(:template_upload).permit(:avatar)
    end
end
