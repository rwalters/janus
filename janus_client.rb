require 'common'

stub = Janus::Janus::Stub.new('app:50051', :this_channel_is_insecure)

p stub.create_address(
    CreateMissionReq.new(
      mission: Generators::Mission.new.call
    )
  )

p stub.get_address(GetMissionReq.new(id: "test"))
p stub.get_address_list(GetMissionListReq.new)
