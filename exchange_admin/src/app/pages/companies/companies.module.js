/**
 * @author v.lugovsky
 * created on 16.12.2015
 */
(function () {
  'use strict';

  angular.module('BlurAdmin.pages.companies', [])
    .config(routeConfig);

  /** @ngInject */
  function routeConfig($stateProvider) {
    $stateProvider
      .state('companies', {
        url: '/companies',
        templateUrl: 'app/pages/companies/companies.html',
        controller: 'CompaniesListCtrl as vm',
        title: 'Company',
        sidebarMeta: {
          icon: 'ion-podium',
          order: 0,
        },
      });
  }
})();
