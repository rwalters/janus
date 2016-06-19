require_relative 'common'

# Configure its logging for fine-grained log control during test runs
module GRPC
  extend Logging.globally
end
Logging.logger.root.appenders = Logging.appenders.stdout
Logging.logger.root.level = :info

stub = Janus::Janus::Stub.new('server:50051', :this_channel_is_insecure)

GRPC.logger.info("#{'='*20}\nCreate a Mission\n")
GRPC.logger.info(
  stub.create_mission(
    CreateMissionReq.new(
      mission: Generators::Mission.new.call
    )
  ).inspect
)

GRPC.logger.info("#{'='*20}\nGet a Mission\n")
GRPC.logger.info(stub.get_mission(GetMissionReq.new).inspect)

GRPC.logger.info("#{'='*20}\nGet a Mission List\n")
GRPC.logger.info(stub.get_mission_list(GetMissionListReq.new).inspect)
