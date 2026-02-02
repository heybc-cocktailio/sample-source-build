<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.net.InetAddress" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cocktail Cloud | K8s Demo</title>
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
            background: rgba(255, 255, 255, 0.75);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.4);
            box-shadow: 0 12px 40px 0 rgba(31, 38, 135, 0.08);
        }

        /* 둥실둥실 떠있는 애니메이션 */
        .floating {
            animation: floating 6s ease-in-out infinite;
        }

        @keyframes floating {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
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
    <div id="main-card" class="glass floating w-full max-w-xl p-10 md:p-14 rounded-[3.5rem] text-center transition-all duration-500">
        
        <!-- Logo -->
        <div class="mb-10 flex justify-center">
            <div class="bg-white/60 p-4 rounded-3xl shadow-sm border border-white/50 transition-transform hover:scale-105 duration-300">
                <img src="<c:url value='/images/cocktail-log.jpg' />" alt="Cocktail Logo" class="max-w-[220px] h-auto" onerror="this.src='https://via.placeholder.com/220x60/3b82f6/ffffff?text=COCKTAIL+CLOUD'"/>
            </div>
        </div>

        <!-- Hero Text -->
        <div class="space-y-4 mb-12 text-center">
            <h1 id="hero-title" class="text-3xl md:text-5xl font-black tracking-tight text-slate-800 cursor-pointer transition-all duration-300 active:scale-95 leading-[1.2]">
                Enterprise <br/>
                <span class="text-transparent bg-clip-text bg-gradient-to-r from-blue-600 to-indigo-600">Kubernetes Platform</span>
            </h1>
        </div>

        <!-- K8s Information Section -->
        <div class="space-y-4 mb-12">
            <div class="flex items-center justify-between px-2 mb-2 text-left">
                <span class="text-[11px] font-black text-slate-400 uppercase tracking-[0.2em]">K8s Pod Identity</span>
                <span class="flex items-center gap-1.5 text-[10px] bg-green-100 text-green-600 px-2.5 py-1 rounded-full font-bold">
                    <span class="w-1.5 h-1.5 bg-green-500 rounded-full animate-pulse"></span>
                    POD CONNECTED
                </span>
            </div>

            <!-- Pod Hostname (JSP 서버 사이드 출력) -->
            <div class="bg-white/40 p-6 rounded-3xl border border-white/60 text-left hover:bg-white/60 transition-all duration-300 group shadow-sm">
                <div class="flex items-center gap-2 mb-2">
                    <div class="p-1.5 bg-blue-100 rounded-lg text-blue-600">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path></svg>
                    </div>
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest">Hostname</span>
                </div>
                <code class="block text-sm font-mono font-bold text-slate-800 tracking-tight pl-1">
                    <%= (System.getenv("HOSTNAME") != null) ? System.getenv("HOSTNAME") : "K8s-Hostname-Not-Found" %>
                </code>
            </div>

            <!-- Pod IP (JSP 서버 사이드 출력) -->
            <div class="bg-white/40 p-6 rounded-3xl border border-white/60 text-left hover:bg-white/60 transition-all duration-300 group shadow-sm">
                <div class="flex items-center gap-2 mb-2">
                    <div class="p-1.5 bg-indigo-100 rounded-lg text-indigo-600">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 12a9 9 0 01-9 9m9-9a9 9 0 00-9-9m9 9H3m9 9a9 9 0 01-9-9m9 9c1.657 0 3-4.03 3-9s-1.343-9-3-9m0 18c-1.657 0-3-4.03-3-9s1.343-9 3-9m-9 9a9 9 0 019-9"></path></svg>
                    </div>
                    <span class="text-[10px] font-black text-slate-400 uppercase tracking-widest">Pod Internal IP</span>
                </div>
                <code class="block text-sm font-mono font-bold text-slate-800 tracking-tight pl-1">
                    <%
                        String podIp = System.getenv("MY_POD_IP");
                        if (podIp == null || podIp.isEmpty()) {
                            try { podIp = InetAddress.getLocalHost().getHostAddress(); }
                            catch (Exception e) { podIp = "IP-Lookup-Failed"; }
                        }
                    %>
                    <%= podIp %>
                </code>
            </div>
        </div>

        <!-- 테마 변경 버튼 -->
        <div class="flex flex-col sm:flex-row gap-3 justify-center pt-4">
            <button onclick="changeTheme('black', 'Night View')" class="px-10 py-4 bg-slate-900 text-white rounded-[1.5rem] font-bold hover:bg-black transition-all active:scale-95 text-xs shadow-xl uppercase tracking-widest">Night View</button>
            <button onclick="changeTheme('white', 'Day View')" class="px-10 py-4 bg-white text-slate-800 border border-slate-100 rounded-[1.5rem] font-bold hover:bg-slate-50 transition-all active:scale-95 text-xs shadow-md uppercase tracking-widest">Day View</button>
        </div>
        <p class="mt-14 text-[10px] text-slate-300 font-bold tracking-[0.2em] uppercase italic">© 2026 Acornsoft / Cocktail Cloud</p>
    </div>

    <script>
        // 제목 클릭 이벤트
        document.getElementById('hero-title').addEventListener('click', function() {
            this.style.color = '#ef4444'; 
            showToast("Primary color modified");
        });

        // 테마 전환 함수
        function changeTheme(theme, label) {
            const body = document.body;
            const card = document.getElementById('main-card');
            const h1 = document.getElementById('hero-title');
            
            showToast(`Applied ${label}`);

            if (theme === 'black') {
                body.classList.add('dark-mode');
                card.style.background = 'rgba(15, 23, 42, 0.9)';
                card.style.borderColor = 'rgba(255, 255, 255, 0.1)';
                h1.style.color = '#f8fafc';
            } else {
                body.classList.remove('dark-mode');
                card.style.background = 'rgba(255, 255, 255, 0.75)';
                card.style.borderColor = 'rgba(255, 255, 255, 0.4)';
                h1.style.color = '#1e293b';
            }
        }

        // 토스트 알림 함수
        function showToast(msg) {
            const toast = document.getElementById('toast');
            toast.innerText = msg;
            toast.style.opacity = '1';
            toast.style.transform = 'translate(-50%, 15px)';
            
            setTimeout(() => {
                toast.style.opacity = '0';
                toast.style.transform = 'translate(-50%, 0)';
            }, 2000);
        }
    </script>
</body>
</html>
