class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  # GET /lists
  # GET /lists.json
  # Listテーブルの全てのデータを取得
  def index
    @lists = List.all
  end
  
  def all_index
    @lists = params[:tag_id].present? ? Tag.find(params[:tag_id]).lists : List.all
    @lists = @lists.page(params[:page])
  end
  # GET /lists/1
  # GET /lists/1.json
  #何もAction内に記載しない場合、render 'show(アクション名)'を省略しているのと同じ効果を持つ

  def show
    @comment = Comment.new(list_id: @list.id)
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists
  # POST /lists.json
  def create
    @list = List.new(list_params)

    # formatがhtmlで指定されていたら@listにリダイレクト、jsonで指定されていたらshowにリダイレクト？
    # 通常時ではHTML形式（いつもウェブサイト上で見る形）で結果を取得したいけど、明示的にJSON形式やXML形式を指定した場合は
    # JSON形式やXML形式で返すようにするメソッドらしい
    # 今回の運用ではhtmlの方しか使わない
    respond_to do |format|
      if @list.save
        format.html { redirect_to @list, notice: 'List was successfully created.' }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lists/1
  # PATCH/PUT /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to @list, notice: 'List was successfully updated.' }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.json
  def destroy
    @list.destroy
    respond_to do |format|
      format.html { redirect_to lists_url, notice: 'List was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def list_params
      params.require(:list).permit(:name, :title, tag_ids: [])
    end
end
