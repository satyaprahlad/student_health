function round2Decimals(decimals) {
    var displayToDecimals = function (value, item) {
        if (!value) {
            return value;
        } else {
            tensPower = Math.pow(10, decimals);
            return Math.round(value * tensPower) / tensPower;
        }
    }
    return displayToDecimals;
}



function ajaxCall(url) {
    return new Promise(function (resolve, reject) {
        $.ajax({
            url: url
        })
            .fail(function (error, status) {
                //alert("Failed to retrieve "+status);
                reject("Faield to Retrieve");
            })
            .then(function (resp) {
                resolve(resp);
            })
    });
}

function ajaxCallAllTypes(params) {
    return new Promise(function (resolve, reject) {
        $.ajax(params)
            .fail(function (error, status) {
                //alert("Failed to retrieve "+status);
                reject(error);
            })
            .then(function (resp) {
                resolve(resp);
            })
    });
}


var originalFilterTemplate = jsGrid.fields.text.prototype.filterTemplate;
//console.log(originalFilterTemplate);
jsGrid.fields.text.prototype.filterTemplate = function () {
    var grid = this._grid;
    if (!this.filtering)
        return originalFilterTemplate;
    var $result = originalFilterTemplate.call(this);
    $result.on("keyup", $.debounce(350, function (e) {
        grid.search();
    }));
    return $result;
}

function MyDateField(config) {
    jsGrid.Field.call(this, config);
};

MyDateField.prototype = new jsGrid.Field({
    sorter: function (date1, date2) {
        return new Date(date1) - new Date(date2);
    },
    _createDate: function ($grid) {
        return $("<input>").datepicker({
            defaultDate: new Date(),
            dateFormat: 'dd/mm/yy',
            onSelect: function (dateText) {
                $grid.search();
            }
        }).prop("readonly", !!this.readOnly);
    },
    _searchDate: function ($grid) {
        if (!this.filtering)
            return "";
        $input = $("<input>");
        $div = $("<div>").append($input);
        $input.daterangepicker({
            change: function (dateText) {
                $grid.search();
            },
            clear: function (dateText) {
                $grid.search();
            },
            datepickerOptions: {
                numberOfMonths: 2,
                maxDate: null
            },

            icon: ""

        });
        return $div;

    },
    filterTemplate: function () {
        if (!this.filtering)
            return "";
        var grid = this._grid,
            $result = this.filterControl = this._searchDate(this._grid);
        return $result;

    },
    filterValue: function () {
        var range = this.filterControl.children().first().daterangepicker("getRange");
        if (range) {
            range.start = (range.start.getTime()) / 1000;
            range.end = (range.end.getTime()) / 1000 - 1;
            return range;
        }
        return null;
    },

    itemTemplate: function (value) {
        return value && new Date(value).toLocaleDateString();
    },
    insertTemplate: function (value) {
        if (!this.inserting)
            return "";
        this._insertPicker = $("<input>").datepicker({defaultDate: new Date()});
        insert_on_enter(this._insertPicker);
        return this._insertPicker;

    },
    editTemplate: function (value) {
        if (!this.editing)
            return this.itemTemplate.apply(this, arguments);
        if (!value) return this._editPicker = $("<input>").datepicker({defaultDate: new Date()});
        this._editPicker = $("<input>").datepicker({dateFormat: "dd/mm/yy"}).datepicker("setDate", new Date(value));
        update_on_enter(this._editPicker);
        return this._editPicker;

    },
    insertValue: function () {
        var date = this._insertPicker.datepicker("getDate");
        if (date) return date.getTime() / 1000;
        return null;
    },
    editValue: function () {
        var date = this._editPicker && this._editPicker.datepicker("getDate");
        if (date) return date.toISOString();
        return null;
    }
});

jsGrid.fields.myDateField = MyDateField;

