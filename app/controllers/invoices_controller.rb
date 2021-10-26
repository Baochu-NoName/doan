class InvoicesController < InheritedResources::Base

  def index
    @invoices = Invoice.all 
  end
  def show
    @invoice = Invoice.find(params[:id]).includes(invoice_items: :order_items)
  end
  private

    def invoice_params
      params.require(:invoice).permit(:invoice_status)
    end
end
