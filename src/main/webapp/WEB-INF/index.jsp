<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    // Kubernetes 환경 변수 읽기
    String clusterId = System.getenv("CLUSTER_ID") != null ? System.getenv("CLUSTER_ID") : "N/A";
    String nodeIp = System.getenv("NODE_IP") != null ? System.getenv("NODE_IP") : "Unknown Node";
    String podName = System.getenv("POD_NAME") != null ? System.getenv("POD_NAME") : "Local Environment";
    String podIp = System.getenv("POD_IP") != null ? System.getenv("POD_IP") : "127.0.0.1";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>K8s Monitoring Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            background-image: url('<c:url value="/images/cloud-background.png" />');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }

        .container {
            max-width: 600px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.9);
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        /* 정보 표시를 위한 스타일 */
        .info-panel {
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            padding: 15px;
            margin: 20px 0;
            text-align: left;
        }
        .info-item {
            margin: 8px 0;
            font-size: 14px;
            color: #333;
        }
        .info-label {
            font-weight: bold;
            color: #555;
            display: inline-block;
            width: 100px;
        }
        .info-value {
            color: #007bff;
            font-family: 'Courier New', Courier, monospace;
        }

        img {
            max-width: 100%;
            margin-bottom: 20px;
        }

        h1, h4 {
            cursor: pointer;
            margin: 10px 0;
        }
    </style>
</head>
<body>
<div class="container">
    <img src="<c:url value='/images/cocktail-log.jpg' />" alt="Daegu Logo" style="max-width: 400px; height: auto;"/>

    <h1 class="text_h1">글자를 클릭하면 빨간색으로 변경</h1>
    <h4 class="text_h2">글자를 클릭하면 파란색으로 변경</h4>

    <hr>

    <div class="info-panel">
        <div class="info-item"><span class="info-label">Cluster ID:</span> <span class="info-value"><%= clusterId %></span></div>
        <div class="info-item"><span class="info-label">Node IP:</span> <span class="info-value"><%= nodeIp %></span></div>
        <div class="info-item"><span class="info-label">Pod Name:</span> <span class="info-value"><%= podName %></span></div>
        <div class="info-item"><span class="info-label">Pod IP:</span> <span class="info-value"><%= podIp %></span></div>
    </div>

    <h3>배경색과 글자색 변경</h3>
    <input type="button" value="Black" onclick="
        alert('Daegu in Cloud');
        document.querySelector('body').style.backgroundColor='black';
        document.querySelector('body').style.color='orange';
    ">
    <input type="button" value="White" onclick="
        alert('Daegu with Cloud');
        document.querySelector('body').style.backgroundColor='white';
        document.querySelector('body').style.color='black';
    ">
</div>

<script>
    document.querySelector('.text_h1').onclick = function () {
        this.style.color = 'red';
    };
    document.querySelector('.text_h2').onclick = function () {
        this.style.color = 'blue';
    };
</script>
</body>
</html>
