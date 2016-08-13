angular.module \main, <[]>
  ..controller \main, <[$scope $http]> ++ ($scope,$http) ->

    $http do
      url: \pokemons.json
      method: \GET
    .success (d) ->
      $scope.pokedex = d.pokemon
      $http do
        url: \mypokemon.json
        method: \GET
      .success (d) ->
        $scope.pokemons = d
        $scope.pokemons.map ->
          it.detail = $scope.pokedex[+it.pokemon_id - 1]
          it.img = it.detail.img
          #ret = /([^/]+)$/.exec it.detail.img
          #it.img = "/img/#{ret.1}"
