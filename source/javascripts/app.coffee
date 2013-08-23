
@app = angular.module('app', [])


@app.controller 'IndexController', ($scope, $http) ->
  events_url = "http://api.meetup.com/2/events/?key=6468958671031515c1e1e284e4413&group_id=1815773&status=upcoming&order=time&limited_events=False&desc=false&callback=JSON_CALLBACK&offset=0&format=json&page=200&fields="
  photos_url="http://api.meetup.com/2/photos/?key=6468958671031515c1e1e284e4413&group_id=1815773&order=time&desc=True&callback=JSON_CALLBACK&offset=0&format=json&page=200&fields="
  $http.jsonp(photos_url)
    .success (data) ->
      debugger
      $scope.slides = data
