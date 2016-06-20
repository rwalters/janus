# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: janus.proto

require 'google/protobuf'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_message 'janus.Error' do
    optional :message, :string, 1
    optional :code, :uint32, 2
    map :keys, :string, :message, 3, 'janus.ErrorMessages'
  end
  add_message 'janus.ErrorMessages' do
    repeated :messages, :string, 1
  end
  add_message 'janus.Mission' do
    optional :id, :int32, 1
    optional :company_name, :string, 2
    optional :client_id, :int32, 3
    optional :mission_name, :string, 4
  end
  add_message 'janus.MissionList' do
    repeated :missions, :message, 1, 'janus.Mission'
  end
  add_message 'janus.CreateMissionReq' do
    optional :mission, :message, 1, 'janus.Mission'
  end
  add_message 'janus.CreateMissionResp' do
    oneof :resp do
      optional :mission, :message, 1, 'janus.Mission'
      optional :error, :message, 2, 'janus.Error'
    end
  end
  add_message 'janus.GetMissionReq' do
    optional :id, :string, 1
  end
  add_message 'janus.GetMissionResp' do
    oneof :resp do
      optional :mission, :message, 1, 'janus.Mission'
      optional :error, :message, 2, 'janus.Error'
    end
  end
  add_message 'janus.GetMissionListReq' do
  end
  add_message 'janus.GetMissionListResp' do
    oneof :resp do
      optional :mission_list, :message, 1, 'janus.MissionList'
      optional :error, :message, 2, 'janus.Error'
    end
  end
end

# Namespace for various messages we use
module Janus
  Error =
    pool.lookup('janus.Error').msgclass
  ErrorMessages =
    pool.lookup('janus.ErrorMessages').msgclass
  Mission =
    pool.lookup('janus.Mission').msgclass
  MissionList =
    pool.lookup('janus.MissionList').msgclass
  CreateMissionReq =
    pool.lookup('janus.CreateMissionReq').msgclass
  CreateMissionResp =
    pool.lookup('janus.CreateMissionResp').msgclass
  GetMissionReq =
    pool.lookup('janus.GetMissionReq').msgclass
  GetMissionResp =
    pool.lookup('janus.GetMissionResp').msgclass
  GetMissionListReq =
    pool.lookup('janus.GetMissionListReq').msgclass
  GetMissionListResp =
    pool.lookup('janus.GetMissionListResp').msgclass

  private

  def pool
    @pool ||= Google::Protobuf::DescriptorPool.generated_pool
  end
end
