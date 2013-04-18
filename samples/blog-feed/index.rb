require 'sinatra'
require 'sinatra/streaming'
require 'cf-runtime'
require 'amqp'

configure do
  EM.next_tick do
    if CFRuntime::CloudApp.running_in_cloud?
      AMQP.connection = CFRuntime::AMQPClient.create_from_svc 'blog-mq'
    else
      AMQP.connection = AMQP.connect
    end
  end
end

get '/' do
  erb :index
end

get '/feed_stream', provides: 'text/event-stream' do
  stream :keep_open do |out|
    AMQP::Channel.new do |channel|
      channel.queue('feed_q', exclusive: true) do |queue|
        queue.bind(channel.fanout("feed_ch")).subscribe do |payload|
          out << "data: #{payload}\n\n"
        end
      end

      timer = EM.add_periodic_timer(20) { out << ":\n" }

      out.callback do
        timer.cancel
        channel.close
      end
    end
  end
end
