# coding: UTF-8

require "steno"
require "steno/core_ext"

module Dea
  class Promise
    def self.resolve(promise)
      f = Fiber.new do
        result = nil

        begin
          result = [nil, promise.resolve]
        rescue => error
          result = [error, nil]
        end

        begin
          yield(result) if block_given?
        rescue => error
          logger.log_exception(error)
          raise
        end
      end

      f.resume
    end

    attr_reader :elapsed_time

    def initialize(&blk)
      @blk = blk
      @ran = false
      @result = nil
      @waiting = []
    end

    def ran?
      @ran
    end

    def fail(value)
      resume([:fail, value])

      nil
    end

    def deliver(value = nil)
      resume([:deliver, value])

      nil
    end

    def resolve
      run if !@ran
      wait if !@result

      type, value = @result
      raise value if type == :fail
      value
    end

    def run
      if !@ran
        @ran = true

        f = Fiber.new do
          begin
            @start_time = Time.now
            @blk.call(self)
          rescue => error
            fail(error)
          end
        end

        f.resume
      end
    end

    protected

    def resume(result)
      # Set result once
      unless @result
        @result = result
        @elapsed_time = Time.now - @start_time

        # Resume waiting fibers
        waiting, @waiting = @waiting, []
        waiting.each(&:resume)
      end

      nil
    end

    def wait
      @waiting << Fiber.current
      Fiber.yield
    end
  end
end
