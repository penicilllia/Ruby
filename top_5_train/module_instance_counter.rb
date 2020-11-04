# frozen_string_literal: true

module InstanceCounter
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    attr_accessor :instance

    def instance_set
      self.instance ||= 0
      self.instance += 1
    end

    def instances
      if self.instance.zero?
        0
      else
        self.instance
      end
    end
  end

  private

  def register_instance
    self.class.instance_set
  end
end
