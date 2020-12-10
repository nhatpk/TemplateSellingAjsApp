(function () {   
    angular
        .module('SellingModule')
        .factory('SellingService', ['$http', 'apiurls', SellingService]);

    function SellingService($http, apiurls) {

        var service = {
            getTemplateDetails: getTemplateDetails,
            MakePayment: MakePayment
        };

        return service;

        //Load all the templates
            function getTemplateDetails() {
                var path = "../../../assets/json/template_data.json";
            return $http.get(path);
            };

        //Make Payment 
            function MakePayment(cardObj) {
                return $http({
                    method: 'POST',
                    url: apiurls.apiDomain + apiurls.payment,
                    data: JSON.stringify(cardObj),
                    dataType: "json"
                });
            };            
    };

})();