<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cocktail Cloud | Demo</title>
    <!-- Tailwind CSS 및 폰트 설정 -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600&family=Noto+Sans+KR:wght@300;400;700&display=swap" rel="stylesheet">
    <style>
        body { 
            font-family: 'Inter', 'Noto Sans KR', sans-serif; 
            transition: background-color 0.3s ease, color 0.3s ease;
        }
        /* 배경 이미지 설정 (JSP 태그 유지) */
        .bg-custom {
            background-image: url('<c:url value="/images/cloud-background.png" />');
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
        }
    </style>
</head>
<body class="bg-custom min-h-screen flex items-center justify-center p-6">

    <!-- 메인 컨테이너 (유저의 0.85 투명도 유지) -->
    <div class="container max-w-2xl bg-white/85 backdrop-blur-sm p-10 rounded-3xl shadow-2xl border border-white/20 text-center">
        
        <!-- 로고 이미지 -->
        <div class="mb-8 flex justify-center">
            <img src="<c:url value='/images/cocktail-log.jpg' />" alt="Cocktail Logo" class="max-w-[300px] h-auto rounded-lg shadow-sm" onerror="this.src='https://via.placeholder.com/300x80?text=Cocktail+Cloud'"/>
        </div>

        <!-- 클릭 이벤트 텍스트 섹션 -->
        <div class="space-y-4 mb-10">
            <h1 class="text_h1 text-2xl md:text-3xl font-bold cursor-pointer hover:opacity-70 transition">
                글자를 클릭하면 빨간색으로 변경
            </h1>
            <h4 class="text_h2 text-lg font-medium text-gray-600 cursor-pointer hover:opacity-70 transition">
                글자를 클릭하면 파란색으로 변경
            </h4>
        </div>

        <!-- Pod 정보 섹션 (Hostname 및 IP 추가) -->
        <div class="bg-blue-50/50 rounded-2xl p-6 border border-blue-100 mb-10 text-left">
            <div class="flex items-center gap-3 mb-4 text-blue-600 border-b border-blue-100 pb-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h14M5 12a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v4a2 2 0 01-2 2M5 12a2 2 0 00-2 2v4a2 2 0 002 2h14a2 2 0 002-2v-4a2 2 0 00-2-2m-2-4h.01M17 16h.01"></path></svg>
                <span class="text-xs font-bold uppercase tracking-widest">Kubernetes Runtime Info</span>
            </div>
            
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <!-- Hostname 섹션 -->
                <div class="space-y-1">
                    <p class="text-[10px] text-gray-400 uppercase font-bold tracking-tighter">Hostname</p>
                    <p id="pod-name" class="font-mono text-blue-700 break-all text-xs font-semibold">
                        <%= (System.getenv("HOSTNAME") != null) ? System.getenv("HOSTNAME") : "Local-Dev-Host" %>
                    </p>
                </div>

                <!-- Pod IP 섹션 -->
                <div class="space-y-1">
                    <p class="text-[10px] text-gray-400 uppercase font-bold tracking-tighter">Internal IP</p>
                    <p id="pod-ip" class="font-mono text-blue-700 break-all text-xs font-semibold">
                        <%
                            String podIp = System.getenv("MY_POD_IP");
                            if (podIp == null) {
                                try {
                                    podIp = InetAddress.getLocalHost().getHostAddress();
                                } catch (Exception e) {
                                    podIp = "127.0.0.1";
                                }
                            }
                        %>
                        <%= podIp %>
                    </p>
                </div>
            </div>
        </div>

        <!-- 테마 변경 버튼 섹션 -->
        <div class="space-y-4">
            <p class="text-sm font-semibold text-gray-400 uppercase tracking-widest">Theme Control</p>
            <div class="flex justify-center gap-4">
                <button onclick="changeTheme('black', 'orange', 'Daegu in Cloud')" 
                        class="px-8 py-3 bg-gray-900 text-white rounded-full font-bold hover:bg-black transition shadow-lg text-sm">
                    Black
                </button>
                <button onclick="changeTheme('white', 'black', 'Daegu with Cloud')" 
                        class="px-8 py-3 bg-white text-gray-900 border border-gray-200 rounded-full font-bold hover:bg-gray-50 transition shadow-lg text-sm">
                    White
                </button>
            </div>
        </div>

        <p class="mt-12 text-gray-400 text-[10px]">© 2024 Acornsoft. Built for Cocktail Cloud Demo.</p>
    </div>

    <script>
        // 텍스트 색상 변경 이벤트
        document.querySelector('.text_h1').onclick = function () {
            this.style.color = 'red';
        };
        document.querySelector('.text_h2').onclick = function () {
            this.style.color = 'blue';
        };

        // 테마 및 알림 변경 함수
        function changeTheme(bgColor, textColor, message) {
            alert(message);
            document.body.style.backgroundColor = bgColor;
            document.body.style.color = textColor;
            
            if(bgColor === 'black') {
                document.querySelector('.container').style.backgroundColor = 'rgba(0, 0, 0, 0.8)';
            } else {
                document.querySelector('.container').style.backgroundColor = 'rgba(255, 255, 255, 0.85)';
            }
        }
    </script>
</body>
</html>
