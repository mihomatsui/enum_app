ActiveAdmin.register Post do
  permit_params :genre, :content

  index do
    selectable_column
    id_column
    #enum-helpを利用
    column :genre, :post, &:genre_i18n
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :id
      # enum-help を利用
      row :genre, :post, &:genre_i18n
      row :content
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.sematic_errors
    f.inputs do
      # enum-helpを利用
      filter :genre, as: :select, collection: Post.genres_i18n.invert
      input :content
    end
    f.actions
  end

  # enum-help を利用
  filter :genre, as: :select, collection: Post.genres_i18n.invert
  filter :content
  filter :created_at
  filter :updated_at
end
