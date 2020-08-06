# This challenge is expected to be long. Expect up to 30 minutes.

1. Use the radio class you created in the Radio project.
2. Create a #play method in the Radio class, which will return an audio stream.
3. Create a SecureRadio class which inherits from Radio.
4. SecureRadio #play method returns an encrypted audio stream.

# How do you encrypt the audio stream?

Using a shift cipher. 

A shift cipher replaces each character of string with a letter that is a fixed number of positions down the alphabet.

With a shift of three:
- A => D, B => E, C => F, D => G

5. Write another class for the shift cipher, called ShiftCipher
6. ShiftCipher will have two class methods: encode(plain_string, 3), decode(cipher_string, 3)
7. The encode method will shift cipher the audio stream, mixing up the letters.
8. The decode method will reverse the encode method.