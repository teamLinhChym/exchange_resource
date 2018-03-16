'use strict';

angular.module('BlurAdmin.pages.companies')
  .controller('CompaniesListCtrl', CompaniesListCtrl);
CompaniesListCtrl.$inject = ['companiesService'];

function CompaniesListCtrl(companiesService) {
  var vm = this;

  companiesService.getCompaniesList().then(function(res) {
    vm.companies = res.companies;
  });
}