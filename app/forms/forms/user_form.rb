module Forms
  class UserForm < Reform::Form
    include DSL
    include Reform::Form::ActiveModel

    properties [:first_name, :last_name], on: :user
    properties [:email, :locale, :age],   on: :profile

    model :user, on: :user

    validates :first_name, :last_name, :email, presence: true
  end
end
