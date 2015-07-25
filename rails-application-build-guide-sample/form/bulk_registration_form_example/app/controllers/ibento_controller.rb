class IbentoController < ApplicationController


  def index
    @i = Ibento.search
  end

  def search
    @i = Ibento.search(search_params)
    @ibento = @i
      .result
      .order(availability: :desc, code: :asc)
      .decorate
  end

  def search_params
    search_conditions = %i(
      ibento kaisaibi kaisaijikan price
      basho
    )
    params.require(:i).permit(search_conditions)
  end

  def ibento_collection_params
    params
      .require(:form_ibento_collection)
      .permit(ibento_attributes: Form::Ibento::REGISTRABLE_ATTRIBUTES)
  end

end
