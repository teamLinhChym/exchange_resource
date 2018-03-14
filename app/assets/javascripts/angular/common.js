'use strict';

angular.module('commonLib', []);

angular.module('commonLib')
  .factory('common', ['$http', '$q', function($http, $q){
    return {
      ajaxCall: ajaxCall,
      ajaxCallWithRes: ajaxCallWithRes
    }

    function ajaxCall(method, url, params, cache){
      var def = $q.defer();
      $http({method: method, url: url, data: params, cache: cache})
        .then(function(res){
          def.resolve(res);
        }), function(err){
          def.reject(res);
        }
      return def.promise;
    }

    function ajaxCallWithRes(method, url, params, url_success, url_fail, cache){
      var def = $q.defer();
      $http({
        method: method,
        url: url,
        data: params,
        cache: cache
      }).then(function(res){
        if(res.data.success){
          location.href = url_success;
        }else{
          location.href = url_fail;
        }
      })
      return def.promise;
    }
  }])
  .config(function($httpProvider, $locationProvider){
    var csrfTokenElm = document.getElementsByName('csrf-token'),
    csrfToken = csrfTokenElm[0] ? csrfTokenElm[0].content : '';
    $httpProvider.defaults.headers.common.Accept = 'application/json';
    $httpProvider.defaults.headers.post['X-CSRF-Token'] = csrfToken;
    $httpProvider.defaults.headers.put['X-CSRF-Token'] = csrfToken;
    $httpProvider.defaults.headers.delete = {'X-CSRF-Token': csrfToken};

    $locationProvider.html5Mode({
      enabled: true,
      requireBase: false,
      rewriteLinks: false //disables url rewriting for relative links
    });
  })
