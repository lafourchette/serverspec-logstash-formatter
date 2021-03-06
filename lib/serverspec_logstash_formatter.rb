require 'rspec/core'
require 'rspec/core/formatters/json_formatter'


class ServerspecLogstashFormatter < RSpec::Core::Formatters::BaseFormatter
        RSpec::Core::Formatters.register self, :message, :stop, :close

        attr_reader :output_hash

        def initialize(output)
          super
          @output_hash = {
            :version => RSpec::Core::Version::STRING
          }
        end

        def message(notification)
          (@output_hash[:messages] ||= []) << notification.message
        end

        def stop(notification)
          @output_hash = notification.examples.map do |example|
            format_example(example).tap do |hash|
              e = example.exception
              if e
                hash[:exception] =  {
                  :class => e.class.name,
                  :message => e.message,
                  :backtrace => e.backtrace,
                }
              end
            end
          end
        end

        def close(_notification)
          @output_hash.each do | entry |
              output.write entry.to_json
              output.write "\n"
          end
          output.close if IO === output && output != $stdout
        end

      private

        def format_example(example)
          {
            :description => example.description,
            :full_description => example.full_description,
            :status => example.execution_result.status.to_s,
            :file_path => example.metadata[:file_path],
            :started_at => example.execution_result.started_at,
            :hostname => ENV.fetch('TARGET_HOST'),
            :line_number  => example.metadata[:line_number],
            :run_time => example.execution_result.run_time,
            :pending_message => example.execution_result.pending_message,
          }
        end
      end
