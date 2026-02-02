<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.InetAddress" %>
<%
    String hostname = InetAddress.getLocalHost().getHostName();
    String ip = InetAddress.getLocalHost().getHostAddress();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>Cocktail Cloud Demo</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background: linear-gradient(135deg, #1e3a8a 0%, #3b82f6 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: 'Inter', sans-serif;
        }
        .glass {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="glass p-12 shadow-2xl text-white text-center max-w-lg w-full">
        <div class="mb-6">
            <h1 class="text-4xl font-extrabold tracking-tight mb-2">Cocktail Cloud</h1>
            <p class="text-blue-200">Container Orchestration Demo</p>
        </div>
        
        <div class="space-y-4">
            <div class="bg-white/10 rounded-lg p-4">
                <p class="text-xs uppercase tracking-widest text-blue-300 mb-1">Pod Hostname</p>
                <p class="text-xl font-mono font-bold"><%= hostname %></p>
            </div>
            
            <div class="bg-white/10 rounded-lg p-4">
                <p class="text-xs uppercase tracking-widest text-blue-300 mb-1">Pod IP Address</p>
                <p class="text-xl font-mono font-bold"><%= ip %></p>
            </div>
        </div>

        <div class="mt-8 pt-6 border-t border-white/10">
            <span class="inline-flex items-center px-3 py-1 rounded-full text-sm font-medium bg-green-400/20 text-green-300">
                <span class="w-2 h-2 mr-2 bg-green-400 rounded-full animate-pulse"></span>
                Running in Kubernetes
            </span>
        </div>
    </div>
</body>
</html>
