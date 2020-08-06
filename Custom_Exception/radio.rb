#!/usr/bin/env ruby
require 'pry'
require_relative "radio_error"
class Radio

    attr_reader :band, :volume, :frequency

    @@fm_frequency = rand(88.0..108.0).floor(1)
    @@am_frequency = rand(540.0..1600.0).floor(1)
    @@volume = rand(1..10)

    def initialize(options = {})
        @band = options[:band] ||= "FM"
        self.volume = options[:volume] ||= 5
        self.frequency = options[:frequency] ||= @@fm_frequency
    end

    def self.fm
        Radio.new
    end

    def self.am
        Radio.new(band: "AM")
    end

    def volume=(volume = @@volume)
        if volume < 1 || volume > 10
            raise RadioError.new("Volume Error", volume)
        else
            @volume = volume
        end
    end

    def frequency=(frequency = @@fm_frequency)
        if self.band == "FM"
            if frequency < 88.0 || frequency > 108.0
                @frequency = @@fm_frequency
            else
                @frequency = frequency
            end
        elsif self.band =="AM"
            if frequency < 540.0 || frequency > 1600.0
                @frequency = @@am_frequency
            end
        elsif !frequency.is_a?(Float)
            @frequency = @@am_frequency
        end
    end

    def status
        "The volume is #{self.volume}, the frequency is #{self.frequency}, the band is '#{self.band}'"
    end

end

begin
    r = Radio.new
    r.volume = rand(11..20)
rescue RadioError => e
    puts "#{e.class}: #{e.message}"
    puts "The volume was set to #{e.volume}"
end