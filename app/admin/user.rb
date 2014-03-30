ActiveAdmin.register User do

  permit_params :email, :password, :password_confirmation,
                :professional_headline, :account_type, :admin, :name

  form do |f|
    f.inputs do
      f.input :email
      f.input :name
      f.input :professional_headline
      f.input :password
      f.input :password_confirmation
      f.input :admin
    end
    f.actions
  end

  index do
    column :email
    column :name
    column :professional_headline
    column :admin
    default_actions
  end


  show do |ad|
    attributes_table do
      row :email
      row :name
      row :professional_headlin
      row :admin
    end
    active_admin_comments
  end
 end
