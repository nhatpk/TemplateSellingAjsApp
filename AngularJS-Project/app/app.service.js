(function () {
    angular
        .module('TemplateSellingApp')
        .factory('AppService', ['$http', 'apiurls', AppService]);

    function AppService($http, apiurls) {

        var service = {
            SubmitForm: SubmitForm
        };
        return service;

        //Validating the Log-In
        function SubmitForm(userName, password) {
            return $http({
                method: 'GET',
                url: apiurls.apiDomain + apiurls.login + apiurls.loginMethod + apiurls.userName + userName + apiurls.password + password
             });           
        };
    };

})();