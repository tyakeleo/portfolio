# 引数のオブジェクトの中身をまとめて返す。@list.idなら
# {"id",1}みたいな感じ
json.extract! list, :id, :name, :title, :created_at, :updated_at
json.url list_url(list, format: :json)
