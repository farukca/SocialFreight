class BranchesController < ApplicationController

  before_filter :require_login

  def new
    @branch = current_patron.branches.build(params[:branch])
  end

  def edit
    @branch = Branch.find_by_slug(params[:id])
  end

  def create
    @branch = current_patron.branches.build(params[:branch])

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
