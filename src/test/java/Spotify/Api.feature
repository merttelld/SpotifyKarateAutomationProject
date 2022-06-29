Feature: APİ
  Background:
    * def token = 'Bearer BQAR_ygg_OJJ7eWfHecuAzHYfkV5QM-QhoHWyHr3LWpbOJeq7WIZZDogydPFNiONFq5EeBOZjW9zgbkzClIkzYgwyb5tg131NPg-vbyeZeOGNQ_J5sqIHIu3MVI3mveKZzBWoxRvyHA1US_jYLhrg9Jam8_E-RCTJHMFlsigwBqKf2Mzsc8b1PiMCI5yjroCsyYAWIuYkoyjNQ4yujVvR6jq1jCbEBswC025KyvlxeHNJQb482LnsOl05ZqQg9rPneLS8g3yQvA'
    * def id = '31pybtscmscb3l6vpyehctpt74f4'
    * def requestBody = 
    """
    {
  "name": "Mertin Listesi",
  "description": "Benim harika mükemmel muazzam şarkı listem",
  "public": false
    }
    """

    * def requestUri =
    """
    {
      "uris": [
      "spotify:track:4u7EnebtmKWzUH433cf5Qv"
       ],
      "position": 0
    }'
    """

    Scenario: (GET metodu)
      Given url "https://api.spotify.com/v1" 
      And path '/me'
      And header Authorization = token
      When method GET
      Then status 200
      @Post
      Scenario: (POST metodu)
        Given url 'https://api.spotify.com/v1'
        And path '/users/'+id+'/playlists'
        And header Authorization = token
        And request requestBody
        When method POST
        Then status 201
        And def pLid = response.id

        Scenario: Search (GET metodu)
          Given url 'https://api.spotify.com/v1'
          And path '/search'
          And header Authorization = token
          And param q = 'track:Bohemian Rhapsody'
          And param type = 'track'
          When method GET
          Then status 200
          
          Scenario: Add song (POST metodu)
            * def callMethod = call read('Api.feature@Post')
            * def playlistid = callMethod.pLid

            Given url "https://api.spotify.com/v1"
            And path '/playlists/'+playlistid+'/tracks'
            And header Authorization = token
            And header Content-type = 'application/json'
            And request requestUri
            When method POST
