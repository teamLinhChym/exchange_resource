'use strict';

var app = angular.module('myPageApp');

app.controller('TestController', TestController);

TestController.$inject = ['common'];

function TestController(common) {
  var vm = this;

  vm.test = function(){
    console.log('Config AJS successfully!')
  }
}
