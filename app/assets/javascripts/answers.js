// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


    function ajaxDataRenderer() {
        var ret = null;
        $.ajax({
            url: "/answers/data_count",
            type: "GET",
            dataType:'json',
            success: function(data) {
                ret = $.parseJSON(data);
                console.log(ret);
            }
        });
        return ret;
    };

    var data_count = ajaxDataRenderer();    

    var array_keys = new Array();
    var array_values = new Array();

    for (var key in data_count) {
        array_keys.push(key);
        array_values.push(data_count[key]);
    }

    alert(array_keys);
    alert(array_values);

    var data = {
    labels:  array_keys,
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.5)",
            strokeColor: "rgba(220,220,220,0.8)",
            highlightFill: "rgba(220,220,220,0.75)",
            highlightStroke: "rgba(220,220,220,1)",
            data: array_values
        },
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

    $( document ).ready(function() {
        var ctx = document.getElementById("myChart").getContext("2d");
        var myBarChart = new Chart(ctx).Bar(data, {stacked: true});
    });
