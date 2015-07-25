class Products2Controller < ApplicationController
  def index
    @q = Product2.search
  end

  def search
    @q = Product2.search(search_params)
    @products2 = @q
      .result
      .order(availability: :desc, code: :asc)
      .decorate
  end

  def new
    @form = Form::Product2Collection.new
  end

  def create
    @form = Form::Product2Collection.new(product2_collection_params)
    if @form.save
      redirect_to :products2, notice: "#{@form.target_products2.size}件の商品を登録しました。"
    else
      render :new
    end
  end

  private

  def search_params
    search_conditions = %i(
      code_cont name_cont name_kana_cont availability_true
      price_gteq price_lteq purchase_cost_gteq purchase_cost_lteq
    )
    params.require(:q).permit(search_conditions)
  end

  def product2_collection_params
    params
      .require(:form_product2_collection)
      .permit(products2_attributes: Form::Product2::REGISTRABLE_ATTRIBUTES)
  end
end
