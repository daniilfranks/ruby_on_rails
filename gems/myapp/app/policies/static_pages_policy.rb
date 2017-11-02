class StaticPagesPolicy < ApplicationPolicy
  def info?
    user.email == 'babanovs5@gmail.com'
  end
end
