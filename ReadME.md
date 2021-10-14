# Scalability 

1. AWS EKS Cluster autoscaler based on policies(ASG).
2. Kubernetes Pod Autoscaler implementation based.


# Security ( Application )
1. Kubernetes pod-pod communication network policies (eg: calico )
2. ALB with security group implementation to EKS security group.
3. WAF policies for load balancer (L7).
4. Implement firewall ( Palo Alto )(L3/L7).
5. AWS Secrets manager for kubernetes environment variables.
6. RDS encryption.
7. Data encryption at REST using KMS keys using different encryption algorithms.
8. AWS cognito integration with oauth.
9. AWS cloudtrail for tracking user activity and aws resource usage.  
10. SAST and DAST implementation for code analysis(Sonarqube etc).

# Security (infrastructure)
1. AWS organization identity and implementation based
2. AWS SSO implementation based on AWS SSO or SAML.
3. SSO permission sets and implement session duration for IAM policies across accounts.
4. VPN implementation for AWS infrastructure access.
5. Separate account setup for management plane vs application plane.


# kubernetes security 
1. Network policies implementation for inter-pod communication traffic.
2. Istio MTLS implementation for secured traffic implementation
3. TLS certificates and certificate rotation for load balancers ( can be AWS handled OR Letsencrypy implementation)
4. Popeye cluster sanitization , Run reports through kube-hunter or kube-bench for different cluster vunerability reports and fixes.
5. Native Image scanning ECR for container scanning for malicious codes.
6. RBAC implementation.
7. POD Security policies.


# Reliability implementaiton
1. RDS disaster Recovery . RPO And RTO cross region backup.
2. RDS multi AZ deployment.

# Other implementations
1. PCIDSS compliance 
2. Govt regulatory complaince for cross country data.
3. HIPPA compliance for health regulatory compliance.
