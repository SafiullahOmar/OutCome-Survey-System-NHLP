<%@ Page Title="" Language="C#" MasterPageFile="~/OuterSiteMaster2.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderPageTitle" runat="Server">
    Dashboard
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderPgDescription" runat="Server">
    overview & stats 
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolderAlert" runat="Server">
    <ul class="mini-stats pull-right">
        <li id="alert"><a href="#">
            <div id="divModal" class="text-center pulse-button">
                <label for="danger" class="btn btn-warning">Numbers of Farmers Whose Contribution Timeline are Out Dated<span class="badge"></span></label>
            </div>
        </a></li>
    </ul>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderPgContent" runat="Server">
    <style>
        .pulse-button {
            position: relative;
            border: none;
            box-shadow: 0 0 0 0 rgba(232, 76, 61, 0.7);
            background-color: #e84c3d;
            background-size: cover;
            background-repeat: no-repeat;
            cursor: pointer;
            -webkit-animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
            -moz-animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
            -ms-animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
            animation: pulse 1.25s infinite cubic-bezier(0.66, 0, 0, 1);
        }

            .pulse-button:hover {
                -webkit-animation: none;
                -moz-animation: none;
                -ms-animation: none;
                animation: none;
            }

        @-webkit-keyframes pulse {
            to {
                box-shadow: 0 0 0 45px rgba(232, 76, 61, 0);
            }
        }

        @-moz-keyframes pulse {
            to {
                box-shadow: 0 0 0 45px rgba(232, 76, 61, 0);
            }
        }

        @-ms-keyframes pulse {
            to {
                box-shadow: 0 0 0 45px rgba(232, 76, 61, 0);
            }
        }

        @keyframes pulse {
            to {
                box-shadow: 0 0 0 45px rgba(232, 76, 61, 0);
            }
        }
    </style>

    <div class="container-fluid container-fullw bg-white">
        <div class="row">
            <div class="col-md-12">
                <div class="tabbable">
                    <ul id="chartnav" class="nav nav-tabs">
                        <li id="exp" class="active">
                            <a data-toggle="tab" href="#myTab1_example1">FC Amount by Province</a>
                        </li>
                        <li id="region">
                            <a data-toggle="tab" href="#myTab1_example2">FC Amount by Region </a>
                        </li>
                    </ul>
                    <div id="containerChart" class="tab-content">
                        <%-- <div id="myTab1_example1" class="tab-pane fade in active">
                            
                        </div>
                        <div id="myTab1_example2" class="tab-pane fade"></div>
                        <div id="myTab1_example3" class="tab-pane fade"></div>--%>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="modal">
            <!-- Place at bottom of page -->
        </div>
    </div>


    <script type="text/javascript">

        $body = $('body');
        $(document).ajaxStart(function () {
            $body.addClass("loading");
        }).ajaxStop(function () { $body.removeClass("loading"); });


        $(function () {


            $.fn.generateAlert = function () {
                $.ajax({
                    type: "POST",
                    url: "Dashboard.aspx/AlertInformation",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        cnt = 0;
                        $.each(data.d, function (i, x) {
                            cnt = cnt + 1;
                        });
                        if (cnt > 0) {
                            //cnount
                            $('#alert').show(); $('.badge').html('').html(cnt);
                            $('#divModal').click(function () {
                                var row = null;
                                var $table = null;
                                $table = '<input type="button" id="my" class="btn-green" value="search">';
                                $table += "<table id='tblFarmerDetail'   class='table '>";
                                var header = "<thead><tr ><th>SN</th><th style='text-align:center;'>Name</th><th style='text-align:center;'>Father Name</th><th style='text-align:center;'>Province</th><th style='text-align:center;'>Region</th><th style='text-align:center;'>EW Name</th><th style='text-align:center;'>Total Amount</th><th style='text-align:center;'>Balance</th><th style='text-align:center;'>Year</th><th style='text-align:center;'>Season</th></tr></thead>";
                                $table += header;
                                var Sno = 1;
                                $.each(data.d, function (i, x) {
                                    row = "<tr ><td style='text-align:center;'>" + Sno + "<span id='spanSeedPlantedId' style='display:none'>" + x.FarmerId + "</span></td>" +
                                      "<td style='text-align:center;'><span>" + x.Name + "  </span></td>" +
                                      "<td style='text-align:center;'><span>" + x.FName + "</span></td>" +
                                      "<td style='text-align:center;'><span>" + x.ProvinceEngName + "</span></td>" +
                                      "<td style='text-align:center;'><span>" + x.RegionName + "</span></td>" +
                                      "<td style='text-align:center;'><span>" + x.ExtName + "</span></td>" +
                                       "<td style='text-align:center;'><span>" + x.TotalAmount + "</span></td>" +
                                       "<td style='text-align:center;'><span>" + x.Balance + "</span></td>" +
                                       "<td style='text-align:center;'><span>" + x.Year + "</span></td>" +
                                       "<td style='text-align:center;'><span>" + x.SeasonName + "</span></td>" +
                                      "</tr>";
                                    $table += row;
                                    Sno++;
                                });
                                $('#farmersList').html($table);
                                $table += "</table>";
                                //$('#MdAlert').modal('show');
                                //modal
                                $.dialog({
                                    title: 'List of Farmers whose Contribution Pay Date were Expired!',
                                    icon: 'glyphicon glyphicon-info-sign',
                                    columnClass: 'col-md-12',
                                    type: 'green',
                                    animation: 'news',
                                    closeAnimation: 'news',
                                    theme: 'dark',
                                    closeIcon: true,
                                    content: '<hr/>' + $table,
                                    onOpen: function () {
                                        //fill dropdowns
                                        $.ajax({
                                            type: "POST",
                                            url: "Dashboard.aspx/ProvinceInfo",
                                            data: '{}',
                                            contentType: "application/json; charset=utf-8",
                                            dataType: "json",
                                            async: false,
                                            success: function (data) {
                                                cnt = []; province = []; S1 = []; S2 = [];
                                                $.each(data.d, function (i, x) {
                                                    province.push(x.province);
                                                    S1.push(x.sample1);
                                                    S2.push(x.sample2);
                                                });

                                            },
                                            failure: function (response) {
                                                alert(response.d);
                                            }
                                        });
                                        this.$content.find('#my').click(function () {
                                            alert('hi');
                                        });
                                    }
                                });


                            });
                        }

                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
            $.fn.drawProvinceInfo = function () {
                $.ajax({
                    type: "POST",
                    url: "Dashboard.aspx/ProvinceInfo",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        cnt = []; province = []; S1 = []; S2 = [];
                        $.each(data.d, function (i, x) {
                            province.push(x.province);
                            S1.push(x.sample1);
                            S2.push(x.sample2);
                        });

                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
                $('#containerChart').highcharts({
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Farmer Contribution Amount'
                    },
                    subtitle: {
                        text: 'Farmer Total Amount and Recieved Amount By Province '
                    },
                    xAxis: {
                        categories: province,
                        crosshair: true

                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true
                    },
                    yAxis: {
                        min: 0, labels: {
                            formatter: function () {
                                return this.value;
                            }
                        },
                        title: {
                            text: 'Contribution By Province'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    series: [{
                        type: 'column',
                        name: 'Total Amount',
                        data: S1
                    }, {
                        type: 'column',
                        name: 'Recieved Amount',
                        data: S2
                    }, ]
                });
            }
            $.fn.drawRegionInfo = function () {
                $.ajax({
                    type: "POST",
                    url: "Dashboard.aspx/RegionInfo",
                    data: '{}',
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: false,
                    success: function (data) {
                        cnt = []; region = []; S1 = []; S2 = [];
                        $.each(data.d, function (i, x) {
                            region.push(x.region);
                            S1.push(x.sample1);
                            S2.push(x.sample2);
                        });
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
                $('#containerChart').highcharts({
                    chart: {
                        type: ''
                    },
                    title: {
                        text: 'Farmer Contribution Amount'
                    },
                    subtitle: {
                        text: 'Farmer Total Amount and Recieved Amount by Region '
                    },
                    xAxis: {
                        categories: region,
                        crosshair: true

                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                            '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true
                    },
                    yAxis: {
                        min: 0, labels: {
                            formatter: function () {
                                return this.value;
                            }
                        },
                        title: {
                            text: 'Contribution by Region'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    series: [{
                        type: 'column',
                        name: 'Total Amount',
                        data: S1
                    }, {
                        type: 'column',
                        name: 'Recieved Amount',
                        data: S2
                    }, ]
                });
            }
            $.fn.clearActive = function () {
                $('#chartnav li').each(function () { $(this).removeClass('active'); });
            }
            ///
            $('#alert').hide();
            $.fn.generateAlert();
            $('#exp').click(function () {
                $.fn.clearActive();
                $('#exp').addClass('active');
                $.fn.drawProvinceInfo();
            });
            $('#region').click(function () {
                $.fn.clearActive();
                $('#region').addClass('active');
                $.fn.drawRegionInfo();
            });

            $("#exp").trigger('click');
            $("#exp").addClass('active');

        });
    </script>
</asp:Content>

