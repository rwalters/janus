module Generators
  # A class to hold code to randomly generate an instance of MissionList
  class MissionList
    # A generator to create a random MissionList
    #
    # @param list_length [Integer]
    #   Defaults to a random number between 1 and 10
    # @return [MissionList]
    #   A randomly generated instance of MissionList
    def call(list_length: (SecureRandom.random_number(9) + 1))
      ::MissionList.new(
        missions: Array.new(list_length) do
          Generators::Mission.new.call(mission_name: 'Gen Mission List')
        end
      )
    end
  end
end
