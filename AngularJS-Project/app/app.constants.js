(function () {
    //This file contains all the Web-Api constants
    angular
        .module('TemplateSellingApp')
        .constant('apiurls', {
            apiDomain: 'http://localhost/REST-WebApi/api/',
            contact: 'Contact',
            login: 'LogIn/',
            loginMethod: 'Authenticate',
            userName: '?userName=',
            password: '&password=',
            payment: 'Payment'
        })
        .constant('constants', {

        });

})();