module Repos
  class Goodcause

    def find(id)
      Organisation.find(id)
    end

    def create(params)
      Organisation.create(params)
    end
  end
end
