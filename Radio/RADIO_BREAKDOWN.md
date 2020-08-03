# For this challenge, you will:

## Create a Radio in Ruby.

1. It has controls for volume, frequency and band(AM/FM)
2. Should be able to set the volume
3. Should have a method called: status -> Which shows what the volume is

### From there:

1. Write an initialize method for volume, frequency and band with defaults for each.
2. Have the frequency values set within an allowed range.
3. FM frequency values range from 88.0 to 108.0
4. AM frequency values range from 540.0 to 1600.0
5. When you set the default for band, it can be read, but it cannot be changed. You created an AM radio, it stays an AM radio.
6. Will be set with Radio.fm, Radio.am
7. Modify the status method so that it returns the frequency, the volume and the band.