module Tolk
  class LocaleController < ApplicationController
    def show
      @locale = Tolk::Locale.where('UPPER(name) = UPPER(?)', params[:locale]).first

      return redirect_to tolk_path unless @locale

      respond_to do |format|
        format.yaml do
          data = @locale.to_hash
          render plain: Tolk::YAML.dump(data)
        end
      end
    end
  end
end
