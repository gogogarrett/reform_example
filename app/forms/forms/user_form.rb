module Forms
  class UserForm < Reform::Form
    include Composition

    properties [:first_name, :last_name], on: :user
    properties [:email, :locale, :age],   on: :profile

    model :user, on: :user

    validates :first_name, :last_name, :email, presence: true
  end
end
