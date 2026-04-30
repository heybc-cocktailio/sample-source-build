package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.Map;

@RestController
public class K8sInfoController {

    @GetMapping("/api/k8s-info")
    public Map<String, String> getK8sInfo() {
        Map<String, String> info = new HashMap<>();
        
        // K8s가 자동으로 넣어주는 API 서버 호스트 IP를 가져옵니다.
        String apiServerIp = System.getenv("KUBERNETES_SERVICE_HOST");
        
        // 클러스터 ID를 "Cluster-(API서버IP)" 형식으로 표시하여 고유성을 확보합니다.
        String clusterDisplayId = (apiServerIp != null) ? "Cluster-API-" + apiServerIp : "Local-Environment";

        info.put("clusterId", clusterDisplayId);
        info.put("nodeIp", System.getenv().getOrDefault("NODE_IP", "N/A"));
        info.put("podName", System.getenv().getOrDefault("POD_NAME", "N/A"));
        info.put("podIp", System.getenv().getOrDefault("POD_IP", "N/A"));
        
        return info;
    }
}
