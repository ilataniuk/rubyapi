class ArticlesSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :created_at, :updated_at

  # def created_at
  #   object.created_at.strftime("%d/%m//%Y %H:%M:%S")
  # end
  #
  # def updated_at
  #   object.updated_at.strftime("%d/%m/%Y %H:%M:%S")
  # end

end
