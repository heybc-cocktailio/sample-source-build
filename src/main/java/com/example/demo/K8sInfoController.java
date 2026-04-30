package com.example.demo; // <-- 이 줄이 반드시 파일 맨 위에 있어야 합니다!

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.Map;

@RestController
public class K8sInfoController {

    @GetMapping("/api/k8s-info")
    public Map<String, String> getK8sInfo() {
        Map<String, String> info = new HashMap<>();
        info.put("clusterId", System.getenv().getOrDefault("CLUSTER_ID", "Local-Cluster"));
        info.put("nodeIp", System.getenv().getOrDefault("NODE_IP", "127.0.0.1"));
        info.put("podName", System.getenv().getOrDefault("POD_NAME", "Local-Pod"));
        info.put("podIp", System.getenv().getOrDefault("POD_IP", "127.0.0.1"));
        return info;
    }
}
