//sdfgadsdfgsdfgsdfsdfgsdfgsdfgqqqqqqqqqq
var app = angular.module('instituteApp', [ 'ngRoute', 'ngSanitize', 'ui.select', 'daterangepicker','ngMaterial']);

app.config(function ($routeProvider) {
    $routeProvider
        // .when("/operations/",
        //     {cache: false,
        //     templateUrl: function (urlAttr) {
        //         return `/operations/`
        //     }}
        // )


})

app.run(async function ($rootScope, $http, $window) {
})
app.controller('applicationController', function ($scope, $rootScope, $http) {
    licenseKey = 'non-commercial-and-evaluation';
    $rootScope.commonHeaders = {"X-CSRFToken": csrfToken, "content-type": "application/json"};
    $rootScope.commonJsonHeaders = $rootScope.commonJsonHeaders
    $rootScope.commonHttpHeaders = {"X-CSRFToken": csrfToken, "content-type": "text/html"};
    $rootScope.epochStartDate = "1970-01-01";
    $rootScope.scrollme = function (){
        var element = document.getElementsByTagName('body');
window.scrollTo(0, document.body.scrollHeight);d
        console.log("scroolled me")

    }


})

app.controller('searchController', function ($timeout, $q, $log, $window, $location, $scope) {
    let insertControl = $("#searchTerm")
    $scope.searchTerm = ""
    insertControl.autocomplete({
        source: function (request, response) {
            // $scope.squad_player_loading = true;
            // $("#squad_player_loading").addClass("ripple-loading")
            $.ajax({
                url: "/operations/search-patient?q=" + request.term,
                dataType: "json",
                success: function (data) {
                    let players = data.map(function (x, i) {
                        return  {label: x.first_name, value:x.id}
                    });
                    //x.common_name, 'value': x
                    response(players);
                },
                complete: function (data) {
                    //$scope.squad_player_loading = false;
                    //$("#squad_player_loading").removeClass("ripple-loading")

                }
            });
        },

        minLength: 1,
        select: function (event, ui) {
           console.log("greaaaaa")
           $window.open(`/operations/patients/${ui.item.value}/edit`, "_parent")
        }
    });
    //insertControl.autocomplete("enable");
    return insertControl;
  })

app.controller('createPatienntController', function ($timeout, $q, $log, $window, $location, $scope) {

  })
app.controller('patientDetailsController', function ($timeout, $q, $log, $window, $location, $scope) {
    modalForm(document.getElementById('add_symptom'), {
        formURL: "add-symptom"
    })
    modalForm(document.getElementById('add_immunization'), {
        formURL: "add-immunizer"
    })
    modalForm(document.getElementById('update_notes'), {
        formURL: "update-notes"
    })
    modalForm(document.getElementById('update_notes'), {
        formURL: "update-notes"
    })
        modalForm(document.getElementById('update_current_conditions'), {
        formURL: "update-current-conditions"
    })
        modalForm(document.getElementById('update_known_allergies'), {
        formURL: "update-known-allergies"
    })
     modalForm(document.getElementById('add_care_provider'), {
        formURL: "add-care-provider"
    })
     modalForm(document.getElementById('add_guardian'), {
        formURL: "add-guardian"
    })

    function closeModal() {
        $(".close").on('click', function (e) {
            location.reload()
        });
    }

    $(".icomoon").on('click', function (){
        setTimeout(closeModal, 1);
    })


});
