module Generators
  class MissionList
    def call(list_length: (SecureRandom.random_number(9) + 1))
      list_length.times.map do
        gen_mission(mission_name: 'Gen Mission List')
      end
    end
  end
end
