require 'spec_helper'

describe Ikasan::Client do
  let(:host) { 'test.ikasan.com' }
  let(:port) { 80 }
  let(:base_url) { "http://#{host}:#{port}" }
  let(:channel) { '#test' }
  let(:message) { 'test message' }
  let(:nickname) { 'ikasan' }
  let(:color) { 'random' }
  let(:message_format) { 'html' }
  let(:client) { Ikasan::Client.new(host, port) }
  let(:base_stub_params) { { channel: channel, message: message, nickname: nil, color: nil, message_format: nil } }

  describe 'POST /notice' do
    it 'basic' do
      stub_request(:post, base_url + '/notice').with(body: URI.encode_www_form(base_stub_params))
      response = client.notice(channel, message)
      expect(response.code.to_i).to eq(200)
    end
    it 'specify nickname' do
      stub_params = base_stub_params.merge(nickname: nickname)
      stub_request(:post, base_url + '/notice').with(body: URI.encode_www_form(stub_params))
      response = client.notice(channel, message, nickname: nickname)
      expect(response.code.to_i).to eq(200)
    end
    it 'specify color' do
      stub_params = base_stub_params.merge(color: color)
      stub_request(:post, base_url + '/notice').with(body: URI.encode_www_form(stub_params))
      response = client.notice(channel, message, color: color)
      expect(response.code.to_i).to eq(200)
    end
    it 'specify message_format' do
      stub_params = base_stub_params.merge(message_format: message_format)
      stub_request(:post, base_url + '/notice').with(body: URI.encode_www_form(stub_params))
      response = client.notice(channel, message, message_format: message_format)
      expect(response.code.to_i).to eq(200)
    end
    it 'specify nickname, color and message_format' do
      stub_params = base_stub_params.merge(nickname: nickname, color: color, message_format: message_format)
      stub_request(:post, base_url + '/notice').with(body: URI.encode_www_form(stub_params))
      response = client.notice(channel, message, nickname: nickname, color: color, message_format: message_format)
      expect(response.code.to_i).to eq(200)
    end
  end

  describe 'POST /privmsg' do
    it 'basic' do
      stub_request(:post, base_url + '/privmsg').with(body: URI.encode_www_form(base_stub_params))
      response = client.privmsg(channel, message)
      expect(response.code.to_i).to eq(200)
    end
    it 'specify nickname' do
      stub_params = base_stub_params.merge(nickname: nickname)
      stub_request(:post, base_url + '/privmsg').with(body: URI.encode_www_form(stub_params))
      response = client.privmsg(channel, message, nickname: nickname)
      expect(response.code.to_i).to eq(200)
    end
    it 'specify color' do
      stub_params = base_stub_params.merge(color: color)
      stub_request(:post, base_url + '/privmsg').with(body: URI.encode_www_form(stub_params))
      response = client.privmsg(channel, message, color: color)
      expect(response.code.to_i).to eq(200)
    end
    it 'specify message_format' do
      stub_params = base_stub_params.merge(message_format: message_format)
      stub_request(:post, base_url + '/privmsg').with(body: URI.encode_www_form(stub_params))
      response = client.privmsg(channel, message, message_format: message_format)
      expect(response.code.to_i).to eq(200)
    end
    it 'specify nickname, color and message_format' do
      stub_params = base_stub_params.merge(nickname: nickname, color: color, message_format: message_format)
      stub_request(:post, base_url + '/privmsg').with(body: URI.encode_www_form(stub_params))
      response = client.privmsg(channel, message, nickname: nickname, color: color, message_format: message_format)
      expect(response.code.to_i).to eq(200)
    end
  end
end
