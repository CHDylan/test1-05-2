<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/8/1
  Time: 10:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>员工管理系统</title>
  <meta name="author" content="DeathGhost" />
  <link rel="stylesheet" type="text/css" href="accest/css/style.css">
  <!--[if lt IE 9]>
  <script src="accest/js/html5.js"></script>
  <![endif]-->
  <script src="accest/js/jquery.js"></script>
  <script src="accest/js/jquery.mCustomScrollbar.concat.min.js"></script>
  <script>

      (function($){
          $(window).load(function(){

              $("a[rel='load-content']").click(function(e){
                  e.preventDefault();
                  var url=$(this).attr("href");
                  $.get(url,function(data){
                      $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
                      //scroll-to appended content
                      $(".content").mCustomScrollbar("scrollTo","h2:last");
                  });
              });

              $(".content").delegate("a[href='top']","click",function(e){
                  e.preventDefault();
                  $(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
              });

          });
      })(jQuery);
  </script>
</head>
<body>
<!--header-->
<header>
  <h1><img src="accest/images/admin_logo.png"/></h1>
  <ul class="rt_nav">
    <%--A标签提交的方式get方式进行提交的--%>
    <li><a href="OutLoginServlet" class="quit_icon">安全退出</a></li>
  </ul>
</header>
<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
  <h2><a href="index.html">${users.name}</a></h2>
  <ul>

    <li>
      <dl>
        <dt>员工管理模块</dt>
        <dd><a href="SelectUsersListServlet">员工查询</a></dd>
        <dd><a href="user_detail.html">员工添加</a></dd>
        <dd><a href="user_rank.html">员工修改</a></dd>
      </dl>
    </li>
    <li>
      <p class="btm_infor"></p>
    </li>
  </ul>
</aside>

<style>
  .dataStatistic{width:400px;height:200px;border:1px solid #ccc;margin:0 auto;margin:10px;overflow:hidden}
  #cylindrical{width:400px;height:200px;margin-top:-15px}
  #line{width:400px;height:200px;margin-top:-15px}
  #pie{width:400px;height:200px;margin-top:-15px}
</style>
<section class="rt_wrap content mCustomScrollbar">

  <div class="rt_content">
    <!--统计图-->
    <section style="overflow:hidden">
      <!--柱状图-->
      <div class="dataStatistic fl">
        <div id="cylindrical">
        </div>
      </div>
      <!--线性图-->
      <div class="dataStatistic fl">
        <div id="line">
        </div>
      </div>
      <!--饼状图-->
      <div class="dataStatistic fl">
        <div id="pie">
        </div>
      </div>
    </section>
    <!--点击加载-->
    <script>
        $(document).ready(function(){
            $("#loading").click(function(){
                $(".loading_area").fadeIn();
                $(".loading_area").fadeOut(1500);
            });
        });
    </script>
    <section class="loading_area">
      <div class="loading_cont">
        <div class="loading_icon"><i></i><i></i><i></i><i></i><i></i></div>
        <div class="loading_txt"><mark>数据正在加载，请稍后！</mark></div>
      </div>
    </section>
    <!--结束加载-->
    <!--弹出框效果-->
    <script>
        $(document).ready(function(){
            //弹出文本性提示框
            $("#showPopTxt").click(function(){
                $(".pop_bg").fadeIn();
            });
            //弹出：确认按钮
            $(".trueBtn").click(function(){
                alert("你点击了确认！");//测试
                $(".pop_bg").fadeOut();
            });
            //弹出：取消或关闭按钮
            $(".falseBtn").click(function(){
                alert("你点击了取消/关闭！");//测试
                $(".pop_bg").fadeOut();
            });
        });
    </script>

  </div>
</section>
<script src="accest/js/amcharts.js" type="text/javascript"></script>
<script src="accest/js/serial.js" type="text/javascript"></script>
<script src="accest/js/pie.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function (e) {
        GetSerialChart();
        MakeChart(json);
    });
    var json = [
        { "name": "数据10", "value": "352" },
        { "name": "数据20", "value": "620" },
        { "name": "数据30", "value": "222" },
        { "name": "数据40", "value": "652" },
        { "name": "数据50", "value": "325" },
        { "name": "数据60", "value": "222" },
        { "name": "数据70", "value": "432" },
        { "name": "数据80", "value": "552" }
    ]
    //柱状图
    function GetSerialChart() {

        chart = new AmCharts.AmSerialChart();
        chart.dataProvider = json;
        //json数据的key
        chart.categoryField = "name";
        //不选择
        chart.rotate = false;
        //值越大柱状图面积越大
        chart.depth3D = 20;
        //柱子旋转角度角度
        chart.angle = 30;
        var mCtCategoryAxis = chart.categoryAxis;
        mCtCategoryAxis.axisColor = "#efefef";
        //背景颜色透明度
        mCtCategoryAxis.fillAlpha = 0.5;
        //背景边框线透明度
        mCtCategoryAxis.gridAlpha = 0;
        mCtCategoryAxis.fillColor = "#efefef";
        var valueAxis = new AmCharts.ValueAxis();
        //左边刻度线颜色
        valueAxis.axisColor = "#ccc";
        //标题
        valueAxis.title = "3D柱状图Demo";
        //刻度线透明度
        valueAxis.gridAlpha = 0.2;
        chart.addValueAxis(valueAxis);
        var graph = new AmCharts.AmGraph();
        graph.title = "value";
        graph.valueField = "value";
        graph.type = "column";
        //鼠标移入提示信息
        graph.balloonText = "测试数据[[category]] [[value]]";
        //边框透明度
        graph.lineAlpha = 0.3;
        //填充颜色
        graph.fillColors = "#b9121b";
        graph.fillAlphas = 1;

        chart.addGraph(graph);

        // CURSOR
        var chartCursor = new AmCharts.ChartCursor();
        chartCursor.cursorAlpha = 0;
        chartCursor.zoomable = false;
        chartCursor.categoryBalloonEnabled = false;
        chart.addChartCursor(chartCursor);

        chart.creditsPosition = "top-right";

        //显示在Main div中
        chart.write("cylindrical");
    }
    //折线图
    AmCharts.ready(function () {
        var chart = new AmCharts.AmSerialChart();
        chart.dataProvider = json;
        chart.categoryField = "name";
        chart.angle = 30;
        chart.depth3D = 20;
        //标题
        //chart.addTitle("3D折线图Demo", 15);
        var graph = new AmCharts.AmGraph();
        chart.addGraph(graph);
        graph.valueField = "value";
        //背景颜色透明度
        graph.fillAlphas = 0.3;
        //类型
        graph.type = "line";
        //圆角
        graph.bullet = "round";
        //线颜色
        graph.lineColor = "#8e3e1f";
        //提示信息
        graph.balloonText = "[[name]]: [[value]]";
        var categoryAxis = chart.categoryAxis;
        categoryAxis.autoGridCount = false;
        categoryAxis.gridCount = json.length;
        categoryAxis.gridPosition = "start";
        chart.write("line");
    });
    //饼图
    //根据json数据生成饼状图，并将饼状图显示到div中
    function MakeChart(value) {
        chartData = eval(value);
        //饼状图
        chart = new AmCharts.AmPieChart();
        chart.dataProvider = chartData;
        //标题数据
        chart.titleField = "name";
        //值数据
        chart.valueField = "value";
        //边框线颜色
        chart.outlineColor = "#fff";
        //边框线的透明度
        chart.outlineAlpha = .8;
        //边框线的狂宽度
        chart.outlineThickness = 1;
        chart.depth3D = 20;
        chart.angle = 30;
        chart.write("pie");
    }
</script>
</body>
</html>
