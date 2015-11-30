// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function ajaxDataRenderer() {
    var ret = null;
    $.ajax({
        url: "/answers/data_count",
        type: "GET",
        dataType:'json',
        success: function(data) {
            data_count = data;

            var array_keys = new Array();
            var array_values = new Array();

            for (var key in data_count) {
                array_keys.push(key);
                array_values.push(data_count[key]);
            }

            var data = {
            labels:  array_keys,
            datasets: [
                {
                    label: "My Second dataset",
                    fillColor: "rgba(151,187,205,0.5)",
                    strokeColor: "rgba(151,187,205,0.8)",
                    highlightFill: "rgba(151,187,205,0.75)",
                    highlightStroke: "rgba(151,187,205,1)",
                    data: array_values
                }
            ]
            };
            var ctx = document.getElementById("myChart").getContext("2d");
            var myBarChart = new Chart(ctx).Bar(data, {stacked: true});

        }
    });
};


$(document).ready(function () {
    ajaxDataRenderer();
});

function btntest_onclick() {
    window.location.href = "/answers/graph/";
} 



/*
$(document).ready(function () {
    $('#test').click(function(){

        ajaxDataRenderer();    
    });
});
*/