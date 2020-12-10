(function () {
    angular
        .module('ContactModule')
        .factory('ContactService', ['$http', 'apiurls', ContactService]);

    function ContactService($http, apiurls) {

        var service = {
            ContactUs: ContactUs
        };

        return service;
        
        //Submit a contact request
        function ContactUs(msgObj) {
            return $http({
                method: 'POST',
                url: apiurls.apiDomain + apiurls.contact,
                data: JSON.stringify(msgObj),
                dataType: "json"
            });
        };
    };

})();