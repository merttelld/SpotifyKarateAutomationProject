Feature: UI
  Background:
    * configure driver = {type:'chromedriver' , executable:'src/test/java/Spotify/driver/chromedriver.exe'}

    Scenario: Spotify Senaryosu
      Given driver 'https://open.spotify.com/'
      * maximize()
      And waitFor('button[data-testid=login-button]').click()
      And input('#login-username', 'mert.eldemir@testinium.com')
      And input('#login-password', 'm1234567m')
      And click('.Button-qlcn5g-0.frUdWl')
      And delay(3000)
      And waitFor('.Type__TypeElement-goli3j-0.eHCcSU.J4xXuqyaJnnwS6s2p3ZB.standalone-ellipsis-one-line').click()
      And delay(3000)
      And click('.Type__TypeElement-goli3j-0.hVBZRJ')
      And delay(3000)
      And input('.f0GjZQZc4c_bKpqdyKbq.JaGLdeBa2UaUMBT44vqI', 'MentorLabs Challenge')
      And click('.ButtonInner-sc-14ud5tc-0.iebPZv.encore-inverted-light-set')
      And delay(3000)
      And input('.Type__TypeElement-goli3j-0.ebHsEf.l42JW4EP_5CU1Ba7jYIc', 'Daft Punk')
      And delay(3000)
      And click('button[data-testid=add-to-playlist-button')
      And delay(3000)
