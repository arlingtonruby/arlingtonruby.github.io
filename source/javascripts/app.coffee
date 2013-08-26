
@app = angular.module('app', [])


@app.controller 'EventsController', ($scope, $http) ->
  $scope.events = []
  $scope.title = "No Upcoming events"
  events_url = "http://api.meetup.com/2/events/?key=6468958671031515c1e1e284e4413&group_id=1815773&status=upcoming&order=time&limited_events=false&desc=false&callback=JSON_CALLBACK&offset=0&format=json&page=200&fields="
  $http.jsonp(events_url)
    .success (data) ->
      if data.results.length == 1
        $scope.title = "1 Upcoming Event"
      else if data.results.length > 1
        $scope.title = "#{data.results.length} Upcoming Events"
      $scope.events = data.results

    $scope.formatDate = (t)->
      (new Date(t)).toString('ddd MMMM d, yyyy @ h:mm tt')

@app.controller 'PhotosController', ($scope, $http) ->
  $scope.photos = []
  photos_url="http://api.meetup.com/2/photos/?key=6468958671031515c1e1e284e4413&group_id=1815773&order=time&desc=True&callback=JSON_CALLBACK&offset=0&format=json&page=200&fields="
  $http.jsonp(photos_url)
    .success (data) ->
      $scope.photos = data.results
