'use strict'
angular.module('cfcApp', [])
.controller('IndexController', ['$scope', '$http', function ($scope, $http) {
        $scope.getUsers = function() {
            var page = Math.floor((Math.random() * 900) + 1);
            $http.get('https://api.github.com/users?since=' + page + '&per_page=10&access_token=357a8f8fc14613a5a35958972025774ad6b01c48').
            success(function(data) {
                $scope.users = new Array();
                angular.forEach(data, function(user, key) {
                    $scope.users.push({
                        'id': user.id,
                        'avatar_url': (user.gravatar_id !== "") ? user.gravatar_id : user.avatar_url,
                        'username': user.login
                    });
                });
            });
        };
        
        $scope.getUser = function(username) {
            console.log(username);
            $scope.avatar_url = "";
            $scope.username = "";
            $scope.email = "";
         
            $http.get('https://api.github.com/users/' + username).
            success(function(data) {
                $scope.avatar_url = data.avatar_url;
                $scope.username = data.name;
                $scope.email = data.email;
            });
        };
        
        $scope.getUsers();
}])
.controller('ListController', ['$scope', '$http', '$window', '$q', function ($scope, $http, $window, $q) {
        
        $scope.usersList = $window.userList;
        $scope.usedNumber = new Array();
        
        $scope.pagination = function(pageNumber) {
            $scope.pUser = new Array();
            var fin = pageNumber * 10;
            var start = fin - 10;
            
            for (var i = start; i < fin; i++) {
                $scope.pUser.push($scope.usersList[i]);
            }
        };
        
        $scope.iniRank = function() {
            $scope.rank = new Array();
   
            angular.forEach($scope.usersList, function(value, index) {
                if (value.rank > 0) {
                    $scope.usedNumber.push(value.rank);
                }
            });
   
            for (var i = 0; i < 50; i++) {
                $scope.rank.push({
                    id: i + 1,
                    name: i + 1,
                    selected: ($scope.usedNumber.indexOf((i + 1).toString()) > -1) ? true : false
                });
            }
        };
        
        $scope.setRank = function(rankNumber, oldRank) {
            if (oldRank !== '') {
                $scope.rank[oldRank - 1].selected = false;
            }
            
            $scope.rank[rankNumber - 1].selected = true;
        };
        
        $scope.save = function () {
            $http({
                method: 'POST',
                url: '/save',
                params: {
                    data: JSON.stringify($scope.usersList)
                },
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            }).
            success(function (response) {
                alert("Saved correctly");
                console.log(response);
            }).
            error(function (response) {
                alert("Request failed");
            });
        };
      
        $scope.reset = function() {
            angular.forEach($scope.usersList, function(val, key) {
                $scope.usersList[key].rank = '';
            });
            
            for (var i = 0; i < 50; i++) {
                $scope.rank.push({
                    id: i + 1,
                    name: i + 1,
                    selected: false
                });
            }
        };
      
        $scope.pagination(1);
        $scope.iniRank();
}])
.controller('DetailsController', ['$scope', '$http', function ($scope, $http) {
    $scope.users = new Array();
    $scope.cnt = 0;
    $scope.find = function() {
        $http.get('https://api.github.com/users/' + $scope.username).
        success(function(data) {
            if (data === '') {
                data = 'No data';
            }
            $scope.users.push({data: data, cnt: ++$scope.cnt});
            console.log(data);
        });
    };
}]);