<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%
//InetAddress inet= InetAddress.getLocalHost();
//String ipAddr = inet.getHostAddress();
//String portNum = String.valueOf(request.getServerPort());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-Transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>
<title>조직포탈에 오신걸 환영합니다.</title>
<link rel="stylesheet" href="${contextPath}/common/css/main.css" type="text/css" />
<script type="text/javascript" src="${contextPath}/common/js/gnb.js"></script>
<script type="text/javascript">
//<![CDATA[
$(document).ready(function(){
    // 비주얼
    $("a").each(function(){ this.hideFocus=true; });
    $("#rollingBanner ul li dl dd").hide();
    $("#rollingBanner ul li dl dd").css({position:"absolute",left:"0",top:"0"});
    $("#rollingBanner ul li dl dd#banner01 ").show();
    $("#rollingBanner ul li dl dt.btn1 a").attr("class","iconOn");
    playImg = setInterval(play, 5000);


    // 로그아웃
    $('#btn_logout').click(function() {
        var params = new Object();
        params.redirectUrl = '/login.do';
        submitDynamicForm('_logoutForm', '<c:url value="/sa/lg/logout.do"/>', 'post', params);
    });

    //생산성 측정

    //정원//////////////////////////////////////////////////////////////////////////
    //정원직급 버튼 클릭 이벤트
    $('#btn_jg').click(function() {
        $(this).addClass('on');
        $('#btn_jm').removeClass('on');

        //var src = '<c:url value="/sa/ma/MainIframe/toInit.do?gubun=QG"/>';
        //$('#iframe1').attr('src', src);
        $.ajax({
            url: '<c:url value="/sa/ma/MainIframe/toInit.do?gubun=QG"/>',
            type: "POST",
            dataType:"html",
            success: function(html){
                $('#mcon4').html(html);

            }
        });
    });

    //정원직무 버튼 클릭 이벤트
    $('#btn_jm').click(function() {
        $(this).addClass('on');
        $('#btn_jg').removeClass('on');

        //var src = '<c:url value="/sa/ma/MainIframe/toInit.do?gubun=QM"/>';
        //$('#iframe1').attr('src', src);
        $.ajax({
            url: '<c:url value="/sa/ma/MainIframe/toInit.do?gubun=QM"/>',
            type: "POST",
            dataType:"html",
            success: function(html){
                $('#mcon4').html(html);
            }
        });
    });

    init();


    //사업현황///////////////////////////////////////////////////////////////////////////////

    //공지사항///////////////////////////////////////////////////////////////////////////////

});

//초기 설정 함수
function init() {
    //공지사항
    //var bbssrc = '<c:url value="/sa/ma/MainIframe/init.do"/>';
    //$('#iframe3').attr('src', bbssrc);
    $.ajax({
        url: '<c:url value="/sa/ma/MainIframe/init.do"/>',
        type: "POST",
        dataType:"html",
        success: function(html){
            $('#mcon1').html(html);
        }
    });

    //사업현황
    //var src = '<c:url value="/sa/ma/MainIframe/nsInit.do"/>';
    //$('#iframe2').attr('src', src);
    $.ajax({
        url: '<c:url value="/sa/ma/MainIframe/nsInit.do"/>',
        type: "POST",
        dataType:"html",
        success: function(html){
            $('#mcon2').html(html);
        }
    });

    //생산성측정
    //var src = '<c:url value="/sa/ma/MainIframe/init4.do"/>';
    //$('#iframe4').attr('src', src);
    $.ajax({
        url: '<c:url value="/sa/ma/MainIframe/init4.do"/>',
        type: "POST",
        dataType:"html",
        success: function(html){
            $('#mcon3').html(html);
        }
    });

    //직급 정원
    $('#btn_jg').trigger('click');
}



// 공지사항
function openBBSPop(bbsid){
    cfn_popupLayer({
        id    : 'modLayer',
        title : '공지사항',
        width : 800,
        height: 350,
        open  : function(e) {
            if(bbsid != '')
                getBBSInfo(bbsid);
        }
     });
}

/**
 * 공지사항 상세조회
 */
function getBBSInfo(bbsid){
    $('input[name=gsbeonho]').val(bbsid);
    ajaxRequest({
        url: '<c:url value="/sh/bs/BBS/selectBBSInfo.do"/>',
        searchMaster:{
            id: 'm1VO',
            toMasterId:'m1VO'
        },
        callback : function(status, data) {
            if (status == 'success' && data != null) {
                $('#gsbeonho_td').text(data.gsbeonho);
                $('#jhsu_td').text(data.jhsu);
                $('#sjilja_td').text(data.sjilja.substr(0,4)+'-'+data.sjilja.substr(4,2)+'-'+data.sjilja.substr(6,2));
                $('#jrilja_td').text(data.jrilja.substr(0,4)+'-'+data.jrilja.substr(4,2)+'-'+data.jrilja.substr(6,2));
                $('#jaemok_td').text(data.jaemok);
                $('#jakeopjanm_td').text(data.jakeopjanm);
                //$('#naeyong_td').html(data.naeyong);
            }
        }
    });
}

//사이트맵
function goSiteMapM(){
    // 사이트맵(현재 페이지에서 레이어 호출)
    cfn_popupLayer({
        id: 'sitemap',
        url: contextPath + '/sitemapM.do',
        title: '사이트맵',
        width: 570,
        height: 550,
        remove: true,
        modal:true,
        open: function() {
        }
    });
}

//매뉴얼
function openManualWindow(){
    window.open('http://exop.ex.co.kr:8050${contextPath}/docs/user_guide.pdf');
}

//비주얼롤링
function play(){
    var imgNum = 5;
    var currentCName = $("#rollingBanner ul li dl dt").has(".iconOn").attr("class");

    if(currentCName!=null){
        var cImg = $("."+currentCName).attr("class").slice(3,4);
        var fImg = 1+Number(cImg);
    }

    if(cImg<imgNum){
        $("#rollingBanner ul li dl dd#banner0"+cImg).fadeOut(2000);
        $("#rollingBanner ul li dl dd#banner0"+fImg).fadeIn(2000);
        $("#rollingBanner ul li dl dt.btn"+cImg+" a").removeAttr("class");
        $("#rollingBanner ul li dl dt.btn"+fImg+" a").attr("class","iconOn");
    }

    if(cImg==imgNum){
        $("#rollingBanner ul li dl dd#banner0"+cImg).fadeOut(2000);
        $("#rollingBanner ul li dl dd#banner01").fadeIn(2000);
        $("#rollingBanner ul li dl dt.btn"+cImg+" a").removeAttr("class");
        $("#rollingBanner ul li dl dt.btn1 a").attr("class","iconOn");
    }
}
//]]>
</script>

 </head>
 <body>
    <!--  header : logo & Navigaion -->
     <div id="main_header">
        <div class="navi">
            <table width="100%" height="100%" class="tbheader">
            <tr height="80" valign="top">
             <td class="logo"><h1><a href="#" onClick="goHome();"><img src="${contextPath}/common/images/logo_new.png" alt="조직포탈"></h1></td>
             <td class="lnb01">
                 <div>
                     <table id="topmenu">
                        <!-- ============================================= -->
                        <!-- 탑메뉴 생성. -->
                        <ex:tmenu type="TOP_M"/>
                        <!-- ============================================= -->
                     </table>
                 </div>
               </td>
               <td class="space"></td>
               <td class="lnb02"></td>
            </tr>
            </table>
            <ul class="glo_menu">
               <%-- TO-DO: 2013.03.20 설문조사(시행) 개발 완료시 HOME 메뉴는 설문조사로 대체해야 함 --%>
               <li><a href="#" onClick="goHome();">HOME</a></li>
               <li><a href="#" onClick="goSiteMapM();">사이트맵</a></li>
               <li><a href="#" onClick="openManualWindow();">매뉴얼</a></li>
               <li><a id="btn_logout" href="${contextPath}/sa/lg/logout.do" target="_top">로그아웃</a></li>
            </ul>
        </div>
        <script type="text/javascript">topnavi(1);</script>
        <!-- top_menu.jsp ......................................................................... -->

    </div>
    <!--//  header : logo & Navigaion -->

    <!-- MainContents -->
    <div id="new_Mainwrap">
        <!-- Main visual -->
        <p class="visutxt"><img src="${contextPath}/common/images/main_txt.png" alt="Global Smart Way" /></p>
        <div id="rollingBanner" class="visuimg">
            <ul>
                 <li>
                     <dl>
                         <dt class="btn1"><a href="#banner01">1번 이미지</a></dt>
                         <dd id="banner01"><a href="#1" ><img src="${contextPath}/common/images/img01.jpg" alt="" /></a></dd>
                     </dl>
                    </li>
                 <li>
                     <dl>
                         <dt class="btn2"><a href="#banner02">2번 이미지</a></dt>
                         <dd id="banner02"><a href="#2"><img src="${contextPath}/common/images/img02.jpg" alt="" /></a></dd>
                     </dl>
                 </li>
                 <li>
                     <dl>
                         <dt class="btn3"><a href="#banner03">3번 이미지</a></dt>
                         <dd id="banner03"><a href="#3"><img src="${contextPath}/common/images/img03.jpg" alt="" /></a></dd>
                     </dl>
                    </li>
                 <li>
                     <dl>
                         <dt class="btn4"><a href="#banner04">4번 이미지</a></dt>
                         <dd id="banner04"><a href="#4"><img src="${contextPath}/common/images/img04.jpg" alt="" /></a></dd>
                     </dl>
                 </li>
                 <li>
                     <dl>
                         <dt class="btn5"><a href="#banner05">5번 이미지</a></dt>
                         <dd id="banner05"><a href="#5"><img src="${contextPath}/common/images/img05.jpg" alt="" /></a></dd>
                     </dl>
                    </li>
                </ul>
        </div>
        <!--// Main visual -->

        <!-- Contents -->
        <div class="newcontents">
            <!-- 배너추가 -->
            <ul class="banner">
                <li><a href="#" onClick="cfn_popupWindow({url:'${contextPath}/op/om/OMINPopup/init.do?menuSeq=111', width:1260,height:800,resize:false,scroll:true,windowNm:'menu111'});"><img src="${contextPath}/common/images/banner01.png" alt="조직정보" /></a></li>
                <li><a href="#" onClick="cfn_goMainFrame('${contextPath}/op/om/OMHTMemberStatus/init.do?menuSeq=111', '111');"><img src="${contextPath}/common/images/banner02.png" alt="정현원정보" /></a></li>
                <li><a href="#" onClick="cfn_goMainFrame('${contextPath}/op/jm/JDHTList/init.do?menuSeq=14', '14');"><img src="${contextPath}/common/images/banner03.png" alt="직무(직위)분석서" /></a></li>
                <li><a href="#" onClick="cfn_goMainFrame('${contextPath}/op/jm/JPMNMng/init.do?pagegubun=5&menuSeq=140', '140');"><img src="${contextPath}/common/images/banner04.png" alt="개인직무관리" /></a></li>
                <li><a href="#" onClick="cfn_goMainFrame('${contextPath}/op/om/BSRPBuildReport/init.do?menuSeq=103', '103');"><img src="${contextPath}/common/images/banner05.png" alt="사업현황" /></a></li>
                <li><a href="#" onClick="cfn_goMainFrame('${contextPath}/sh/ar/SHRE/ARMNPopup.do?menuSeq=28', '28');"><img src="${contextPath}/common/images/banner06.png" alt="위임전결규정" /></a></li>
            </ul>
            <!-- 1열 -->
            <div class="row1th">
                <!-- 공지사항 -->
                <div class="notice">
                    <div class="maintit">
                        <h3><img src="${contextPath}/common/images/mtit_notice.png" alt ="공지사항" /></h3>
<%-- 20130314
                        <a onClick="cfn_goMainFrame('<c:url value="/sh/bs/Noti.do"/>','151');"><span class="more"><img src="${contextPath}/common/images/btn_more.png" alt="더보기" /></span></a>
 --%>
                    </div>
                    <div id="mcon1">
                        <!-- Detail part -->
                        <%--
                        <iframe id="iframe3" name="iframe3" src="" width="100%" height="150px;" frameborder="0" marginwidth="0" scrolling="no"></iframe>--%>
                    </div>
                </div>

                <!-- 사업현황 -->
                <div class="biz">
                    <div class="maintit">
                        <h3><img src="${contextPath}/common/images/mtit_biz.png" alt ="사업현황" /></h3>
                        <span class="more"><a onClick="cfn_goMainFrame('/exspe/op/om/BSRPBuildReport/init.do?menuSeq=103', '103');"/><img src="${contextPath}/common/images/btn_more.png" alt="더보기" /></a></span>
                    </div>

                    <div id="mcon2">
                        <!-- Detail part -->
                        <%--
                        <iframe id="iframe2" name="iframe2" src="" width="100%" height="150px;" frameborder="0" marginwidth="0" scrolling="no"></iframe>--%>
                    </div>
                </div>
            </div>
            <!--// 1열 -->

            <!-- 2열 -->
            <div class="row2th">
                <!-- 생산성측정 -->
                <div class="maingraph">
                    <div class="maintit">
                        <h3><img src="${contextPath}/common/images/mtit_graph.png" alt ="생산성측정" /></h3>
                        <span class="more"><a onClick="cfn_goMainFrame('/exspe/op/om/OMPMMn5Dtl/init.do?menuSeq=130&jpbrcode=1&jpgbcode=001', '130');"><img src="${contextPath}/common/images/btn_more.png" alt="더보기" /></a></span>
                    </div>

                    <div id="mcon3">
                        <!-- Detail part -->
                        <%--
                        <iframe id="iframe4" name="iframe4" src="" width="100%" height="250px;" frameborder="0" marginwidth="0" scrolling="no"></iframe>--%>
                    </div>
                </div>

                <!-- 정원 -->
                <div class="mem">
                    <div class="maintit">
                        <h3><img src="${contextPath}/common/images/mtit_mem.png" alt ="정원" /></h3>
                        <ul class="memtab">
                            <li class="tab01" id="btn_jg"><a>직급</a></li>
                            <li class="tab02" id="btn_jm"><a>직무</a></li>
                        </ul>
                        <%--<f:button label="직급" type="2"  /><f:button label="직무" type="2" id="btn_jm" />--%>
                    </div>

                    <div id="mcon4">
                        <!-- Detail part -->
                        <%--
                        <iframe id="iframe1" name="iframe1" src="" width="100%" height="250px;" frameborder="0" marginwidth="0" scrolling="no"></iframe>--%>
                    </div>
                </div>
            </div>
            <!--// 2열 -->
        </div>
        <!--// Contents -->
    </div>
    <!-- Mainwrap -->

<!--  레이어 -->
<div id="modLayer" style="display:none" style="z-index:1;">
    <!-- Master part -->
    <table class="section">
           <tr>
            <td>
                <!-- Master area -->
                <table id="m1VO" class="master_table">
                    <colgroup>
                        <col width="25%" />
                        <col width="25%" />
                        <col width="25%" />
                        <col width="25%" />
                    </colgroup>
                    <f:input name="gsbeonho" type="hidden"/>
                    <%--<f:input name="mainyn" type="hidden" value="Y"/>--%>
                    <tr>
                        <th>게시번호</th>
                        <td id="gsbeonho_td">
                        </td>
                        <th>조회수</th>
                        <td id="jhsu_td">
                        </td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td id="jaemok_td"></td>
                        <th>작성자</th>
                        <td id="jakeopjanm_td"></td>
                    </tr>
                    <tr>
                        <th>게시 시작일</th>
                        <td id="sjilja_td">
                        </td>
                        <th>게시 종료일</th>
                        <td id="jrilja_td"></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td colspan="3" id="naeyong_td">
                            <textarea name="naeyong" rows="10" cols="100"  readonly="readonly"></textarea>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>

</div>

<!--  footer -->
<div class="footer">
    <address><img src="${contextPath}/common/images/footer_address.gif" alt="(우) 461-703  경기도 성남시 수정구 대왕판교로 805(금토동 293-1)"/></address>
    <p><img src="${contextPath}/common/images/footer_copyright.gif" alt="Copyright(c)2012 Korea Expressway Corporation All Rights Reserved."/></p>
</div>
<!--//  footer -->
 </body>
</html>
