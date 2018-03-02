'use strict';

var app = angular.module('myPageApp');

app.controller('TestController', TestController);

function TestController() {
  var vm = this;

  vm.test = function(){
    console.log('Config AJS successfully!')
  }
}
