class Admins::EndusersController < Admins::ApplicationController
  def index
      @endusers = Enduser.all
      @endusers_deleate = Enduser.only_deleted.all
      @endusers = Enduser.page(params[:page]).reverse_order
  end

  def show
      @enduser = Enduser.find(params[:id])
      @tests = ['__','北海道', '青森県', '岩手県', '宮城県', '秋田県', '山形県', '福島県', '茨城県', '栃木県', '群馬県', '埼玉県', '千葉県', '東京都', '神奈川県', '新潟県', '富山県', '石川県', '福井県', '山梨県', '長野県', '岐阜県', '静岡県', '愛知県', '三重県', '滋賀県', '京都府', '大阪府', '兵庫県', '奈良県', '和歌山県', '鳥取県', '島根県', '広島県', '山口県', '徳島県', '香川県', '愛媛県', '高知県', '福岡県', '佐賀県', '長崎県', '熊本県', '大分県', '宮崎県', '鹿児島県', '沖縄県']
      @tests[@enduser.prefecture]
      @favorites = Favorite.where(enduser_id: @enduser.id)
      @favorites = @favorites.page(params[:page]).reverse_order
      @tax = Tax.find(1)
  end

  def edit
      @enduser = Enduser.find(params[:id])
  end

  def update
      @enduser = Enduser.find(params[:id])
      if @enduser.update(enduser_params)
         flash[:notice] = "successfully"
         redirect_to admins_enduser_path(@enduser)
      else
        render action: :edit
      end
  end

  def destroy
      enduser = Enduser.find(params[:id])
      enduser.destroy
      redirect_to admins_endusers_path
  end

  private
  def enduser_params
      params.require(:enduser).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :postcode, :prefecture, :address, :phone_number, :email)
  end
end