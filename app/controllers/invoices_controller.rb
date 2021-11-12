class InvoicesController < ApplicationController
  before_action :set_order
  before_action :set_invoice, only: [:show, :update]
  before_action :set_product
  before_action :set_user
  before_action :set_order_items
  before_action :set_order_item
  before_action :authenticate_user!

  def index
    @invoices = current_user.invoices.all
  end
  def show
    @invoice = Invoice.find(params[:id])
  end
  def edit
  end
  def new
    @invoice = current_user.invoices.new
    @invoice.invoice_items.build
  end
  def create
    @invoice = current_user.invoices.create(invoice_params)
    @invoice.product_id = @product.id
    if @invoice.save
      flash[:notice] = "Invoice was created successfully!"
      redirect_to invoices_path
    else
      render action: :new
    end
    @order_item.destroy_all
  end

  def update
    @invoice = current_user.invoices.find(params[:id])
    @invoice.update(invoice_params)
    flash[:notice] = "Update successfully"
    flash.keep(:notice)
    redirect_to invoices_path
  end
  private
    def set_invoice
      @invoice = Invoice.find_by(params[:id])
    end 

    def invoice_params
      params.require(:invoice).permit(:status, :total, 
        :username, 
        :phone_number,
        invoice_items_attributes: [:id,:product_name,
        :product_unit_price, 
        :product_quantity ]).with_defaults(total: @order.subtotal.to_s.to_d, 
        order_id: @order.id, 
        status: "pending", 
        user_id: @user.id)
    end
    def set_order
      @order = current_order
    end
     def set_product
      @product = Product.find_by(params[:product_id])
    end
    def set_user
      @user = current_user
    end
    def set_order_item
      @order_item = OrderItem.all
    end
    def set_order_items
      @order_items = current_order.order_items
    end
end
