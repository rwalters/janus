# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: paycheck.proto for package 'paycheck'

require 'grpc'
require 'paycheck'

module Janus
  module Janus

    # TODO: add proto service documentation here
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'janus.Janus'

      rpc :CreateMission, CreateMissionReq, CreateMissionResp
      rpc :GetMission, GetMissionReq, GetMissionResp
      rpc :GetMissionList, GetMissionListReq, GetMissionListResp
    end

    Stub = Service.rpc_stub_class
  end
end