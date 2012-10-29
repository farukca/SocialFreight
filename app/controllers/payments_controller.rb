class PaymentsController < ApplicationController

  before_filter :require_login

  def index
  end

  def new
   	@payoff = Payoff.find(params[:payoff_id]) if params[:payoff_id]
  	if @payoff
       @payment = @payoff.payments.build()
       @payment.staff_id = @payoff.staff_id
  	else
  	   @payment = Payment.new
    end
    @payment.payment_date = Date.today
  end


  def show
    @payment = Payment.find(params[:id])
  end

  def edit
    @payment = Payment.find(params[:id])
  end

  def create
    @payment = Payment.new(params[:payment])
    @payment.creater_id = current_user.id
    @payment.updater_id = current_user.id

    respond_to do |format|
      if @payment.save
        format.html { redirect_to @payment.payoff, notice: 'Payment added successfully.' }
        #format.html { render 'detail', notice: 'Loading was successfully created.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end

  end

end
