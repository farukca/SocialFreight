class BranchesController < ApplicationController

  before_filter :require_login

  def index
    @branches = Branch.all
    render :layout => "admin"
  end

  def new
    @branch = Branch.new
  end

  def edit
    @branch = Branch.find(params[:id])
  end

  def create
    @branch = Branch.new(params[:branch])

    respond_to do |format|
      if @branch.save
        format.html { redirect_to @branch.patron, notice: 'Branch was successfully created.' }
        format.json { render json: @branch, status: :created, location: @branch }
      else
        format.html { render action: "new" }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

end
