#!/usr/bin/env ruby
require_relative 'radio'
require_relative 'shift_cipher'

class SecureRadio < Radio

    def play
        super(shifter)
    end

    protected

    def shifter
        ShiftCipher.encode(audio_stream, 3)
    end

end