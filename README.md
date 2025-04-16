<div align="center">
  <h1 style="background-color:#FFFFFF; color:#000000; padding:15px; border-radius:10px;">
    Guhun Gwon
  </h1>
</div>

## ⚒️ Tech Stack

<p align="center">
  <!-- DevOps -->
  <img src="https://img.shields.io/badge/Ansible-EE0000?style=for-the-badge&logo=ansible&logoColor=white"/>
  <img src="https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWX-EE0000?style=for-the-badge&logo=ansible&logoColor=white"/> 

  <!-- Linux -->
  <img src="https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black"/>

  <!-- Apache, Tomcat, Haproxy -->
  <img src="https://img.shields.io/badge/Apache-D22128?style=for-the-badge&logo=apache&logoColor=white"/>
  <img src="https://img.shields.io/badge/Tomcat-F8DC75?style=for-the-badge&logo=apache-tomcat&logoColor=black"/>
  <img src="https://img.shields.io/badge/HAProxy-000000?style=for-the-badge&logo=haproxy&logoColor=white"/>

  <!-- SVN -->
  <img src="https://img.shields.io/badge/Subversion-809CC9?style=for-the-badge&logo=subversion&logoColor=white"/>

  <!-- DevOps (추가 항목) -->
  <img src="https://img.shields.io/badge/Terraform-623CE4?style=for-the-badge&logo=terraform&logoColor=white"/>

  <!-- Kubernetes -->
  <img src="https://img.shields.io/badge/Kubernetes-326CE5?style=for-the-badge&logo=kubernetes&logoColor=white"/>

  <!-- Docker -->
  <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"/>

  <!-- NGINX -->
  <img src="https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white"/>

  <!-- Git -->
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=git&logoColor=white"/>

  <!-- AWS 관련 -->
  <img src="https://img.shields.io/badge/AWS CodePipeline-6DB33F?style=for-the-badge&logo=amazonaws&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazon-aws&logoColor=white"/>
  <img src="https://img.shields.io/badge/AWS EKS-FF9900?style=for-the-badge&logo=amazon-eks&logoColor=white"/>
</p>



## 🔨 기술 스택 요약

## 💸 Cloud & Infra
AWS 인프라 운영: EC2, ELB, VPC, SG, Lambda, CloudWatch, IAM, ASG

클라우드 마이그레이션: IDC → AWS 전환 (EOS 이슈 해결)

비용 최적화 경험: SP /RI 적용, ASG, 리소스 구조 개선, 탄력적 인프라 구성, S3 Lifecycle Policy


## ⚙️ DevOps & 자동화 
CI/CD 파이프라인 구축 및 운영: Jenkins, AWS CodeDeploy, Git, Bitbucket, CodePipeline

👉 [CI 이미지](https://github.com/guhun-gwon/guhun-gwon/blob/main/images/jenkins_CI.png)

👉 [CD 이미지](https://github.com/guhun-gwon/guhun-gwon/blob/main/images/codedeploy_CD.png)

배포 전략: Blue/Green, Rolling, 무중단 배포 설계 및 적용

배포 자동화 도구 활용: Ansible, PowerShell, Shell Script


## 📦 IaC (Infrastructure as Code)  
Terraform: VPC 구성, 네트워크 자동화, 모듈화 구성, EKS 구성

 👉 [terraform-eks-demo 참조](https://github.com/guhun-gwon/guhun-gwon/tree/main/terraform-demo)
 
 👉 [argocd-demo 참조](https://github.com/guhun-gwon/guhun-gwon/tree/main/argocd-demo)

 👉 [argocd-demo 이미지](https://github.com/guhun-gwon/guhun-gwon/blob/main/images/argocd.png)

 

Ansible: 서버 구성 자동화, 배포 스크립트 작성, 구성 관리

👉 [ansible AWS 이미지](https://github.com/guhun-gwon/guhun-gwon/blob/main/images/ansible_awx.png)

 

## 📊 모니터링 & 운영
모니터링 시스템 구축: Scouter, Grafana, CloudWatch + Slack

Alert 지표 최적화 및 성능 모니터링 구축

로그 및 장애 대응 체계 운영


## 🛠️ 시스템 운영 및 유지보수  
On-P 환경 운영 경험: IDC, XenCenter 기반 Private Cloud, 2000EA 이상 서버 유지보수

네트워크 및 보안: 방화벽 정책, DNS, SSL 인증서, 백업 정책 관리

미들웨어 운영: Apache, Tomcat, JBoss 성능 튜닝 및 업그레이드



## 🔨 경력

###  타이드스퀘어 (2022.09 ~ 재직중) — *2년 8개월*

###  지메이트시스템즈 (2014.09 ~ 2022.09) — *8년 1개월*



## 🔨 Project

### 1. AWS 기반 IaC 자동화 인프라 구축
- **기간**: 2024.09 ~ 2024.11 (3개월)  
- **역할**: Terraform 및 Ansible을 활용한 클라우드 인프라 자동화  
- **성과**:  
  - VPC, NAT Gateway, Subnet, SG 등 네트워크 인프라를 Terraform으로 모듈화  
  - 인프라 구축 소요 시간 약 50% 단축  
  - 코드 기반 인프라 재현성과 유지보수 효율성 확보  

---

### 2. ISMS 대응 시스템 점검 자동화 스크립트 개발
- **기간**: 2024.02 ~ 2024.05 (3개월)  
- **역할**: Ansible 기반 시스템 보안 점검 자동화  
- **성과**:  
  - 패스워드 정책, 계정 관리 등 보안 항목 자동화 스크립트 개발  
  - 100대 이상의 서버에 일괄 적용하여 점검 시간 80% 단축  
  - ISMS 감사 대응용 점검 템플릿 및 리포트 자동화  

---

### 3. AWS 기반 CI/CD 자동화 파이프라인 구축
- **기간**: 2023.09 ~ 2023.12 (4개월)  
- **역할**: Jenkins 및 CodeDeploy 기반 CI/CD 파이프라인 구성  
- **성과**:  
  - Bitbucket → Jenkins → CodeDeploy 자동화 연동  
  - EC2 대상 무중단 배포 프로세스 구현  
  - 파이프라인 구성으로 배포 오류율 감소 및 배포 시간 30% 단축  

---

### 4. IDC 서비스의 AWS 마이그레이션 및 운영 고도화
- **기간**: 2022.12 ~ 2023.09 (10개월)  
- **역할**: 온프레미스 서비스의 클라우드 전환 및 모니터링 고도화  
- **성과**:  
  - 현대카드 프리비아 서비스 AWS 마이그레이션 전담  
  - ASG 기반 자동 복구 구조 설계  
  - Grafana + CloudWatch 기반 통합 모니터링 시스템 구성  

---

### 5. IDC 배포 안정성 강화 및 고도화
- **기간**: 2022.10 ~ 2022.12 (3개월)  
- **역할**: 무중단 배포 전략 설계 및 자동화  
- **성과**:  
  - Jenkins 파이프라인에 Rolling 배포 적용  
  - 배포 후 Ansible을 통한 상태 점검 및 검증 절차 자동화  
  - 운영 중 서비스 중단 없이 배포 완료  

---
## 🔨 Contact

📧 Email: [ghgwon20@naver.com](mailto:ghgwon20@naver.com)
