#!/usr/bin/env ruby
class Radio

    attr_reader :band, :volume,  :frequency

    def initialize(volume = rand(1..10), frequency = rand(88.0..108.0).floor(1), band="FM")

        if band != "FM"
            @band = "AM"
        else
            @band = band
        end

        self.volume = volume
        self.frequency = frequency
    end

    def self.fm
        Radio.new
    end

    def self.am
        Radio.new(rand(1..10), rand(88.0..108.0).floor(1), "AM")
    end

    def volume=(volume = rand(1..10))
        if volume < 1 || volume > 10
            @volume = rand(9)
        else
            @volume = volume
        end
    end

    def frequency=(frequency = rand(88.0..108.0).floor(1))
        if self.band == "FM"
            if frequency < 88.0 || frequency > 108.0
                @frequency = rand(88.0..108.0).floor(1)
            else
                @frequency = frequency
            end
        elsif self.band =="AM"
            if frequency < 540.0 || frequency > 1600.0
                @frequency = rand(540.0..1600.0).floor(1)
            end
        elsif !frequency.is_a?(Float)
            @frequency = rand(540.0..1600.0).floor(1)
        end
    end

    def status
        "The volume is #{self.volume}\nThe frequency is #{self.frequency}\nThe band is #{self.band}"
    end

end