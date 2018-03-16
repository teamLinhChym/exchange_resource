'use strict';

angular.module('BlurAdmin.pages.companies')
  .factory('companiesService', ['common', companiesService]);

function companiesService(common) {
  return {
    getCompaniesList: getCompaniesList
  }
  function getCompaniesList(params) {
    return common.ajaxCall('GET', '/manager/companies', params);
  }
}
