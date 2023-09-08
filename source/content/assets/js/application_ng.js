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

        .when('/products/:product_id', {
            cache: false,
            templateUrl: function (urlAttr) {
                return `/showroom/products/${urlAttr.product_id}?uq=${invite.uq}&date=${new Date().toString()}`
            }
        })
        .when('/invites/:invite_id/cart', {
            templateUrl: function (urlAttr) {
                return `/showroom/invites/${urlAttr.invite_id}/cart?uq=${invite.uq}`
            }
        })
        .when('/invites/:invite_id/checkout', {
            templateUrl: function (urlAttr) {
                return `/showroom/invites/${urlAttr.invite_id}/checkout?uq=${invite.uq}`
            }
        })
        .when('/invites/:invite_id/orders/:order', {
            templateUrl: function (urlAttr) {
                return `/showroom/invites/${urlAttr.invite_id}/orders/${urlAttr.order}?uq=${invite.uq}`
            }
        })
        .when('/invites/:invite_id/choose_delivery_options', {
            templateUrl: function (urlAttr) {
                return `/showroom/invites/${urlAttr.invite_id}/choose_delivery_options?uq=${invite.uq}`
            }
        })

    // .when('products/:product_id', function (urlAttr){
    //     return {templateUrl: `/showroom/products/${urlAttr.product_id}?uq=${invite.uq}`}
    // })

    // .when('/showroom/invites/:invite_id/checkout', function (urlAttr) {
    //     return {templateUrl: `/showroom/invites/${urlAttr.invite_id}/checkout?uq=${invite.uq}`}
    // })
})

app.run(async function ($rootScope, $http, $window) {
})
app.controller('applicationController', function ($scope, $rootScope, $http) {
    licenseKey = 'non-commercial-and-evaluation';
    $rootScope.commonHeaders = {"X-CSRFToken": csrfToken, "content-type": "application/json"};
    $rootScope.commonJsonHeaders = $rootScope.commonJsonHeaders
    $rootScope.commonHttpHeaders = {"X-CSRFToken": csrfToken, "content-type": "text/html"};
    $rootScope.epochStartDate = "1970-01-01";

    console.log("started")
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





  //   document.addEventListener('DOMContentLoaded', (e) => {
  //   console.log("loaded doc")
  //   modalForm(document.getElementById('add_symptom'), {
  //   formURL: "add-symptom"
  // })
});

//     $scope.add_symptom =function ($event) {
//         modalForm($event.currentTarget, {
//             formURL: "add-symptom"
//         })
//
//     document.addEventListener('DOMContentLoaded', (e) => {
//   modalForm(document.getElementById('create-book'), {
//     formURL: "{% url 'create_book' %}"
//   })
// });
//         // $event.stopPropagation();
//         // $event.preventDefault();
//     }

  //   document.addEventListener('DOMContentLoaded', (e)=>
  //   {
  //       modalForm(document.getElementById('add-symptom'), {
  //   formURL: "{% url 'add_symptom' %}"
  // })
  //   })
  //})

app.controller('studentsController', function($scope, $rootScope, $http){

})
app.controller('admissionsController', function($scope, $rootScope, $http, $location){
            var justLoaded = true;

})

app.controller('coursesController', function($scope, $rootScope, $http){

})
app.controller('attendanceController', ['$scope', '$rootScope', '$http', '$timeout', '$element','$controller', '$location' , async function($scope, $rootScope, $http, $timeout, $element, $controller, $location){
    let existingParams = $location.search();
    $scope.is_first_time_loading = true;
    $scope.search_term = existingParams.search_term || ""
    $scope.is_active=true;
    if (existingParams.start_date) {
        $scope.date = {
            startDate: moment(existingParams.start_date),
            endDate: moment(existingParams.end_date)
        };
    }else {
            $scope.date = {
            startDate: moment().startOf('month'),
            endDate: moment().endOf('month')
        };
    }

    $scope.singleDate = moment().add(30, "days");
    $scope.opts = {
        locale: {
            applyClass: 'btn-green',
            applyLabel: "Apply",
            fromLabel: "From",
            format: "YYYY-MM-DD",
            toLabel: "To",
            cancelLabel: 'Cancel',
            customRangeLabel: 'Custom range'
        },
        ranges: {
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()]
        }

    };

    $scope.$watch('date', function(dateRange) {
        $scope.hasDateChanged = true;
        $scope.loadData()
    }, false);
    $scope.getDateClass =function (i){
        let dateClass = ""
        if($scope.dates_header_row[i].toString().substring(0,10) == new Date().toString().substring(0,10)){
            dateClass = "today"
        }
        dateClass.length && console.log(dateClass, i)
        return dateClass
    }
    $scope.isMarkingDisabled =function (i){
        return $scope.dates_header_row[i].toDate().getTime() > new Date().getTime()
    }
    $scope.updateView = function (){
            $scope.dates_header_row = []
            let start = moment($scope.date.startDate)
            let temp = start;
            let end = moment($scope.date.endDate)
            $scope.entireAttendanceMatrix = []
            while(true){
                    $scope.dates_header_row.push(moment(temp))
                    temp = moment(temp.add(1, 'days'))
                    if(temp.valueOf() > end.valueOf()){
                        break;
                    }
                }
            //console.log($scope.dates_header_row)
            $scope.admissions.forEach(admission=>{
                admission.attendance_date_wise = $scope.dates_header_row.map(y=>!!$scope.get_attendance_record(admission, y))
            })
            //console.log($scope.entireAttendanceMatrix)
        }
     $scope.get_attendance_record = function (admission, date){
            return admission.attendance_list.find(function(x){return x.marked_on == date.format("YYYY-MM-DD")})
        }
    $scope.updateAttendance = function (row, j) {
        let admission = $scope.admissions[row]
        let date = $scope.dates_header_row[j]
        let is_present = admission.attendance_date_wise[j] //Retrieved from newly changed
        //let is_present = $scope.is_present(admission, date)
        if(!is_present){
            if(!confirm("are you sure to make absent?")){
                admission.attendance_date_wise[j] = !admission.attendance_date_wise[j]
                return
            }
        }

        function refreshAdmissionRecord() {
            let url = `admissions/${admission.id}`
            let request = $http({
                method: 'GET',
                url: url,
                data: '',
                headers: commonHeaders
            })
            request.then(function (response) {
                console.log("refreshed admission")
                admission = response.data;
                admission.attendance_date_wise = $scope.dates_header_row.map(y=>!!$scope.get_attendance_record(admission, y))
                $scope.admissions[row] = admission
            }, function (response) {
                console.error(response.statusText);
            })
        }

        if (is_present) {
            //Now mark the attendacne
            let attendance = {
                marked_on: date.format("YYYY-MM-DD"),
                marked_for: admission.id
            }
            let url = 'attendances'
            let request = $http.post(url, JSON.stringify(attendance), {headers: commonHeaders})
                .then(function (response) {
                    console.log(response.data);
                    console.log("created attendance")
                    refreshAdmissionRecord()
                }, function (response) {
                    console.error("failed to update derby")
                    console.error(response.statusText)
                })

        } else {
            //Means attedance already there. Just unmark it.
            let attendance_record = $scope.get_attendance_record(admission, date)
            let url = `attendances/${attendance_record.id}`
            let request = $http.delete(url, {headers: commonHeaders})
                .then(function (response) {
                    console.log("deleted attendance");
                    refreshAdmissionRecord()
                }, function (response) {
                    console.error("failed to update derby")
                    console.error(response.statusText)
                })

        }

    }
    $scope.loadData = function (){
        let search_params = ""
        if($scope.date.startDate && $scope.date.endDate){
            search_params = `start_date=${$scope.date.startDate.toISOString().substr(0,10)}&end_date=${$scope.date.endDate.toISOString().substr(0,10)}`
        }
        search_params = (search_params.length ? search_params+"&" : "") + `search_term=${$scope.search_term.trim()}`
        search_params = `${search_params}&is_active=${$scope.is_active}`
        let url = 'admissions'
        if(search_params.length > 0){
            url = `${url}?${search_params}`
        }
        $scope.is_loading =  true;
        let request = $http({
                method: 'GET',
                url:url,
                data: '',
                headers: commonHeaders})
        request.then(function (response){
            $scope.admissions = response.data;
            $scope.updateView()
            $scope.is_loading = false;
            $scope.is_first_time_loading = false;
            getPagination('#attendance_table');
        }, function (response){
            $scope.is_loading = false;
            console.error(response.statusText);
        })


    }

}])

