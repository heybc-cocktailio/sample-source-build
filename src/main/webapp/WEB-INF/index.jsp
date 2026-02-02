<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cocktail Cloud | Cloud-Native Demo</title>
    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;600;700;800&display=swap" rel="stylesheet">
    <style>
        body { 
            font-family: 'Pretendard', sans-serif;
            margin: 0;
            overflow: hidden;
            transition: background 0.5s ease;
        }

        /* 클라우드 느낌의 동적인 배경 애니메이션 */
        .cloud-bg {
            background: linear-gradient(120deg, #e0f2fe 0%, #f0f9ff 50%, #dbeafe 100%);
            background-size: 200% 200%;
            animation: gradientBG 15s ease infinite;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* 유리 효과 (Glassmorphism) */
        .glass {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255, 255, 255, 0.4);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.07);
        }

        /* 둥실둥실 떠있는 애니메이션 */
        .floating {
            animation: floating 6s ease-in-out infinite;
        }

        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }

        .dark-mode {
            background: linear-gradient(120deg, #0f172a 0%, #1e293b 100%) !important;
        }
    </style>
</head>
<body class="cloud-bg min-h-screen flex items-center justify-center p-4">

    <!-- Toast Notification (상태 변경 알림) -->
    <div id="toast" class="fixed top-8 left-1/2 -translate-x-1/2 px-8 py-3 bg-white/90 text-blue-600 text-sm font-bold rounded-full shadow-lg opacity-0 transition-all duration-500 z-50 border border-blue-100">
        Message
    </div>

    <!-- Main Card -->
    <div id="main-card" class="glass floating w-full max-w-xl p-10 md:p-14 rounded-[3rem] text-center transition-all duration-500">
        
        <!-- Logo -->
        <div class="mb-10 flex justify-center">
            <div class="bg-white/50 p-4 rounded-3xl shadow-sm border border-white/50">
                <img src="<c:url value='/images/cocktail-log.jpg' />" alt="Cocktail Logo" class="max-w-[220px] h-auto" onerror="this.src='https://via.placeholder.com/220x60/3b82f6/ffffff?text=COCKTAIL+CLOUD'"/>
            </div>
        </div>

        <!-- Hero Text -->
        <div class="space-y-4 mb-12">
            <h1 id="hero-title" class="text-3xl md:text-4xl font-extrabold tracking-tight text-slate-800 cursor-pointer hover:scale-105 transition-transform duration-300">
                Enterprise Kubernetes <br/>
                <span class="text-blue-600">Management Platform</span>
            </h1>
        </div>

        <!-- K8s Information Section -->
        <div class="space-y-4 mb-10">
            <div class="flex items-center justify-between px-2 mb-2 text-left">
                <span class="text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">K8s Pod Identity</span>
                <span class="flex items-center gap-1.5 text-[10px] bg-green-100 text-green-600 px-2 py-0.5 rounded-full font-bold">
                    <span class="w-1.5 h-1.5 bg-green-500 rounded-full animate-pulse"></span>
                    ACTIVE POD
                </span>
            </div>

            <!-- Pod Hostname (JSP 서버 사이드 출력) -->
            <div class="bg-white/40 p-5 rounded-2xl border border-white/50 text-left group hover:bg-white/60 transition-colors shadow-sm">
                <div class="flex items-center gap-2 mb-1.5">
                    <svg class="w-4 h-4 text-blue-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
                    <span class="text-[10px] font-bold text-slate-400 uppercase">Pod Hostname</span>
                </div>
                <code class="block text-sm font-mono font-bold text-slate-700 tracking-tight">
                    <%= (System.getenv("HOSTNAME") != null) ? System.getenv("HOSTNAME") : "Local-Dev-Host" %>
                </code>
            </div>

            <!-- Pod IP (JSP 서버 사이드 출력) -->
            <div class="bg-white/40 p-5 rounded-2xl border border-white/50 text-left group hover:bg-white/60 transition-colors shadow-sm">
                <div class="flex items-center gap-2 mb-1.5">
                    <svg class="w-4 h-4 text-indigo-500" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"></path></svg>
                    <span class="text-[10px] font-bold text-slate-400 uppercase">Internal Network Address</span>
                </div>
                <code class="block text-sm font-mono font-bold text-slate-700 tracking-tight">
                    <%
                        String podIp = System.getenv("MY_POD_IP");
                        if (podIp == null) {
                            try { podIp = InetAddress.getLocalHost().getHostAddress(); }
                            catch (Exception e) { podIp = "127.0.0.1"; }
                        }
                    %>
                    <%= podIp %>
                </code>
            </div>
        </div>

        <!-- Theme Controls -->
        <div class="flex flex-col sm:flex-row gap-3 justify-center">
            <button onclick="changeTheme('black', 'Night View')" 
                    class="px-10 py-3.5 bg-slate-800 text-white rounded-2xl font-bold hover:bg-slate-900 transition-all active:scale-95 text-xs shadow-xl uppercase tracking-widest">
                Night View
            </button>
            <button onclick="changeTheme('white', 'Day View')" 
                    class="px-10 py-3.5 bg-white text-slate-800 border border-slate-100 rounded-2xl font-bold hover:bg-slate-50 transition-all active:scale-95 text-xs shadow-md uppercase tracking-widest">
                Day View
            </button>
        </div>

        <p class="mt-14 text-[11px] text-slate-400 font-medium tracking-wide">
            &copy; 2026 ACORNSOFT. POWERED BY COCKTAIL CLOUD.
        </p>
    </div>

    <script>
        // 텍스트 클릭 시 색상 변경 이벤트
        document.getElementById('hero-title').addEventListener('click', function() {
            this.style.color = '#ef4444'; 
            showToast("Primary color modified");
        });

        // 테마 변경 함수
        function changeTheme(theme, label) {
            const body = document.body;
            const card = document.getElementById('main-card');
            const h1 = document.getElementById('hero-title');
            
            showToast(`Applied ${label}`);

            if (theme === 'black') {
                body.classList.add('dark-mode');
                card.style.background = 'rgba(15, 23, 42, 0.85)';
                card.style.borderColor = 'rgba(255, 255, 255, 0.1)';
                h1.style.color = '#f8fafc';
            } else {
                body.classList.remove('dark-mode');
                card.style.background = 'rgba(255, 255, 255, 0.7)';
                card.style.borderColor = 'rgba(255, 255, 255, 0.4)';
                h1.style.color = '#1e293b';
            }
        }

        // 토스트 알림 함수
        function showToast(msg) {
            const toast = document.getElementById('toast');
            toast.innerText = msg;
            toast.style.opacity = '1';
            toast.style.transform = 'translate(-50%, 10px)';
            
            setTimeout(() => {
                toast.style.opacity = '0';
                toast.style.transform = 'translate(-50%, 0)';
            }, 2000);
        }
    </script>
</body>
</html>
